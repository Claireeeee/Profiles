#程序格式

	.section .data       #data。text。bbs
		output: .ascii "University of CAS\n"   #标号名，类型，内容  #.byte .word、.int、.float、.asciz 
											   #bytevar: .byte 0x80, 0x81   #wordvar: .word 0x100, 0x8200
	.section .text
	.globl _start       #固定名_start，必须设为.globl全局变量
	_start:             #_start标号开始
		movl $4,%eax    #指令后缀:l,b,w  #寄存器名加%，立即数、标号引用加$（$5，$'0'）   #目的寄存器在最右边
		movl $1,%ebx    #传递参数系统调用参数
		movl $output, %ecx   # 1. $output：标号（地址）做为常量使用  2.  output：标号作为地址使用（会取其中地址做数据）
		movl $20, %edx     
		int $0x80          	 #中断：Linux约定0x80(128)号软中断为系统调用

		movl $1,%eax         #eac存放系统调用号，4号是写文件，1号是程序退出
		movl $0,%ebx
		int $0x80

$ as -o hello.o hello.S  #汇编
$ ld -o hello hello.o    #链接
$ ./hello      #直接运行当前目录下hello




#补充
	• 4号调用:写文件
		– EBX:文件描述符，1表示终端
		– ECX:输出缓冲区(Buffer)的地址 
		– EDX:输出的字节数
	• 1号调用:程序退出 
		– EBX:返回值

#间接地址跳转或调用加*
	#会取当前数据做地址，从中取出数据做最终地址
	CALL *%eax
	JMP *(%eax)

#内存操作数寻址（计算）
	• movb var, %al
	• movw (%ebx), ax
	• movl $4, 4(%ebx)
	• movl (%ebx, %esi),%eax    #base+index
	• movl 4(%ebx, %esi),%eax   #base+index+disp
	• movl %eax, (%ebx, %esi, 2)  #base+index*scale
	• movl 4(%ebx, %esi, 2), %eax
	• movl 4(,%esi,2), %eax

#常见指令
	• MOV、MOVSX、MOVZX、XCHG
		错误示范：
			movb bytevar, 4(%ebx) #两个内存操作数

		MOV：
			movl $bytevar, %ebx 
			movb 1(%ebx), %al 
			movb bytevar+2, %ah

		MOVSX、MOVZX：零扩展与符号扩展

			movzbw bytevar, %ax    //字 word 16字节
			movsbw bytevar+1, %cx 
			movzwl %cx, %ebx
			movswl wordvar+2, %edx

		XCHG：交换两个地址中的数据。也是不可以都是内存操作数

	• INC、DEC、ADD、SUB、NEG
		incb bytevar /*8位内存操作数*/
		incw bytevar /*16位内存操作数*/
		incl bytevar /*32位内存操作数*/
		dec %al  #寄存器可以确定位数
		inc %al

		addb $-1, %al 
		subw $2,%ax 
		incb %al

		neg %al  #修改为相反数（补码）
 

	• DIV、IMUL、 MUL、IDIV、CBW/CWD/CDQ

		MUL，DIV src：无符号数乘除  #隐含eax： src*eax， src／eax
		IMUL src／src，dst／src1，src2，dst： 有符号数乘
		IDIV src： 有符号数除  #隐含eax：eax／src

	• AND、OR、XOR、NOT
		orb $0x80, %al #右边是目的操作数。会按照结果设置eflags
		andl $-1, %eax 
		xorl $0x7f7f, %eax

	• TEST、CMP  src1， src2
		test：src1 & src2
		cmp： src2 - SignExtend(src1)

	• Jcc、JMP dest
		无符号：ja, jb, jae, jbe, jna, jnb, jnae, jnbe   #cmp的src2 xxx src1
		有符号：jg, jl, jge, jle, jng, jnl, jnge, jnle   

	• CMOVcc:根据条件码进行数据传输

	• CALL、RET、PUSH、POP、LEAVE
		call dst =push(eip)+jmp dst
		ret src = {eip<-pop} + {esp=esp+src} (退栈src个字节)
		push src
		pop dst
		leave = {esp=ebp} + {ebp=pop()} (释放一个栈阵)

	• SHL/SAL、SHR、SAR  count, dst
		H,A,L,R

	• LEA、NOP
		lea src,dest： 直接装载（一般用于地址）：src不解引用，直接放入dest  eg. lea 11(%esp), %ecx
		nop src： 啥也不干，就走一下指令流程，EX段啥也不做
	• IRET：中断返回




If-else结构
	cmp xxx，xxx
	Jcc L1
		... # if branch 
	jmp L2
	L1:
		... #else branch
	L2:



循环
#1. 

	jmp L2

	L1:      #loop body
		...

		修改循环变量

	L2:
		cmp xxx, xxx
		Jcc L1



#2.

	L1:
		cmp xxx, xxx
		Jcc L2 
		#loop body 
			... 

			修改循环变量 
		jmp L1

	L2:


#3. do-while

	L1:
		#loop body
			...

			修改循环变量

			cmp xxx, xxx 
			Jcc L1
	L2:

#4. loop

	L1:
		#loop body
			...

			修改循环变量

			loop L1  #隐含修改循环次数 %ecx： 每次-1.为0时结束
	L2:




#函数与函数调用

	指令：call，ret
	ABI：
		1. 参数传递顺序：左到右——栈顶到栈低
		2. 返回值：eax
		3. 寄存器保存
			caller：eax，edx，ecx
			callee：ebx，edi，esi
		4. 返回地址在栈中
		5. 进栈出栈要配对


#1. 函数定义：

		.type function_name, @function
		.globl function_name 
	function_name:
		建立新栈桢(根据需要)  #pushl %ebp  +   movl %esp, %ebp  +  subl $16, %esp  叶子函数可以不用开新栈帧
		保存寄存器(根据需要) 
		读取参数            #movl 8(%ebp), %eax #参数之后又push了eip和ebp，所以+8  （不开新栈+4就好）

		初始化局部变量(根据需要) 
		函数/过程体
		
		返回值存入EAX 
		恢复保存的寄存器(根据需要) 
		恢复栈(根据需要)     #leave  （如果开了新栈帧的话）
		ret


#2. 函数调用

		保存寄存器(根据需要)
		准备参数(按从右到左顺序入栈)
			movl 24(%esp), %eax
			movl %eax, 4(%esp) 
			movl 20(%esp), %eax 
			movl %eax, (%esp)
			（之后在call的时候压了eip，在新函数中压了ebp（可选））
		call function_name
		恢复寄存器(根据需要)
		读取返回值进一步操作







#数组、结构：从汇编程序中识别出数组或结构的操作

	/*
	int get_pgh_digit
	  (int index, int dig)
	{
	  return pgh[index][dig];
	}
	*/

	movl 8(%ebp),%eax         # index
	leal (%eax,%eax,4), %eax  # 5*index
	addl 12(%ebp),%eax        # 5*index+dig
	movl pgh(,%eax,4), %eax   # offset 4*(5*index+dig)


#嵌入式汇编

	基本型：直接加入到编译后的汇编代码中（一般只用于独立函数）
		asm [ volatile ] ("Assembler Instructions")
		用\n\t划分不同语句

		asm("movl $1,%eax\n\tmovl $0, %ebx\n\tint $0x80");
		//or
		asm( 
		         "movl $1,%eax\n\t"   #直接使用寄存器，有可能与前面代码冲突
		         "movl $0, %ebx\n\t"
		         "movl a, %eax\n\t"  #a为c语言中定义的变量，基本型只能引用全局变量
		         "int $0x80"
		         );

	扩展型：更格式化的变量引用：变量列表：操作权限、数据类型、统一编号（间接使用寄存器）

	asm [volatile] ( Assembler Template 
	: Output Operands #输出元：
	[ : Input Operands  #输入元
		[ : Clobbers ]  
	])



	int inc(int src)
	{
	   int dst;
	   asm ("mov %1, %0\n\t"  #编号引用变量
	        "add $1, %0"
			: "=r" (dst)    #=号：只接受修改，不可被读（有符号修饰代表是输出变量表）  
								#（还有+：读和写；&：表示变量随时可被修改（添加在=／+的后面）
												#（不只是仅在最后承载一个输出（这样的话就可以与输入变量共用一个集村去）），进而不能和输入变量共用寄存器
							#r：表示在这段汇编中，这个变量是个寄存器变量（具体寄存器由汇编指定）
							       #（还有m和i，表示内存与立即数；g：三者均可; 数字x：与已编号为x的变量使用同一位置）  
							#引用：通过编号引用。输入输出操作数统一编号引用，编号按位置自动赋予，从0开始

	        : "r" (src), "i"(8));   #无符号修饰：表示是输入操作数表。其他与输出类似

	   asm ("imull %%edx, %%ecx\n\t"   #寄存器引用：%%
			"movl %%ecx, %%eax"
			: "=a" (result)            #指定寄存器：在r的位置，直接指定寄存器：a=eax，d=edx  c=ecx
			: "d" (data1),"c"(data2));

	   asm ("imull %[data1], %[data2]"  #汇编内部定义的变量名引用：% + [name]
	   		:[data2] "+r" (data2)       #指定变量名
	   		:[data1] "r" (data1));
	   
	   return data2;
	   return dst;
	}



#常规优化


	• 代码外提：循环内部的重复语句（冗余）：在循环外部计算一次，用寄存器保存起来，在循环中直接使用寄存器中保存的值
	• 强度削弱：简单的操作代替复杂的操作：比如移位代替乘除
	• 删除公共子表达式：公共的子表达式——临时变量，复用（还是去重复和冗余）
	• 消除不必要访存：中间结果不需要保存回内存，在寄存器变量中操作就好
	• 循环展开：

	对应的汇编修改


#中断处理程序

	Inthandler: 
		保存寄存器         #用到的寄存器都需要保存
	    中断处理程序主体
	    恢复寄存器
		iret

		inthandler:
		        pushw   %ax
		1:      movb    (%si), %al
		        test    %al, %al
		        jz      1f
		        subb    $'a', %al
		        cmp     $26, %al
		        jae     2f
		        addb    $0x41, %al
		        movb    %al, (%si)
		2:      inc     %si
		        jmp     1b
		1: 		pop %ax
				iret

#安全与攻击

	• 缓冲区溢出

	很多C库函数不检查buffer大小:
		gets，strcpy
		scanf, fscanf, sscanf, when given %s conversion specification

	在数据读写拷贝时
		– 写入的数据大小超过目标缓冲区的大小 • Buffer overflow (stack buffer overflow)
		– 读出的数据大小超过源缓冲区的大小 • Buffer over-read (Openssl heartbleed)



#期中试题
1. 
	struct aa{
	    char a;
	    int b;
	};
	该结构整体占了8字节：int型变量地址要求4字节对齐，所以char型a后面会空三个字节出来
2. 
	内存上的 0x2356，0x80ab 两个连续存储的值，实际对应的数值是 0x80ab2356

3. 改错：
	1. 开了栈帧的函数，最后一定记得leave释放

4. 读程序
	1.
		func1:
			mov 4(%esp), %eax 
			test %eax, %eax 
			jns L1       #检查是否为负数
			neg %eax     #取相反数
		L1:
			ret
		#程序功能为取绝对值
	2.
		func2:
			mov 4(%esp), %edx  #字符串地址
			xor %ecx, %ecx     #清空%ecx
		L1:
			mov (%edx), %al    #取字符
			test %al, %al      #检测字符是否为0
			jz L2
			inc %ecx
			inc %edx
			jmp L1
		L2:
			mov %ecx, %eax
			ret
			
		#程序功能: 求字符串长度

	3. 
		浮点介绍：
		FPU有 8 个独立寻址的80位寄存器，r0, r1, …, r7，以堆栈形式组织（寄存器栈），栈顶也写为st(0)，最后一个寄存器写作st(7)
		FPU另有3个16位的寄存器，分别为控制寄存器、状态寄存器、标记寄存器

		浮点指令：
		#前缀f表示fpu操作，ld加载，st保存设置，p后缀弹出堆栈，s、l、t后缀表示单精度，双精度，扩展精度
		1. 数据在内存与寄存器间传送：
			fld，fst  #load与store  #后缀有s和l，分别表示单精度与双精度
		2. 计算
			fadd    
			fdiv
			fdivr
			fmul   
			fsub    
			fsubr 
			格式：
				# 内从中的32位或者64位值和%st(0)相加
				fadd source
				 
				# 把%st(x)和%st(0)相加，结果存入%st(0)
				fadd %st(x), %st(0)
				 
				# 把%st(0)和%st(x)相加，结果存入%st(x)
				fadd %st(0), %st(x)
				 
				# 把%st(0)和%st(x)相加，结果存入%st(x)，弹出%st(0)
				faddp %st(0), %st(x)
				 
				# 把%st(0)和%st(1)相加，结果存入%st(1)，弹出%st(0)
				faddp
				 
				# 把16位或32位整数与%st(0)相加，结果存入%st(0)
				fiadd source

		func3:
			movl 8(%esp), %edx  #edx和eax分别为序列的末尾和起始地址
			movl 4(%esp), %eax
			fldz                #将0.0装入st(0)（浮点寄存器）
			testl %edx, %edx   
			jle L2
			leal (%eax,%edx,8), %edx
		L1:
			faddl (%eax)      #序列求和（隐含了操作数st(0)）
			addl $8, %eax     #地址移动8位
			cmpl %edx, %eax 
			jne L1
		L2:
			ret
		#程序功能: 求浮点向量各元素的累加和

5. 写程序
	1. 返回两个参数中较大的值
		compare:
			movl 4(%esp), %edx 
			movl 8(%esp), %eax 
			cmpl %eax, %edx   
			cmovge %edx, %eax      #cmov，嗷嗷，太绝了；记得返回值是放在eax中的
		L1:
			ret































