



 A4纸，黑色签字笔手写。不需画格，页边距上下左右各约2cm，第一行靠左侧顶格书写“科学前沿进展名家系列讲座报告”，第二行居中书写自拟报告题目，第三行居中略靠右书写班级、专业、学号、姓名。



就抄吧，这篇信息量很大的，抄够3000字就好了

写的时候注意一下一行几个，多少行





科学前沿进展名家系列讲座报告

芯片后门问题与cpu的结构——胡伟武院士讲座有感

IC的制作过程：

IC芯片(**Integrated Circuit**集成电路)是将大量的微电子元器件(晶体管、电阻、电容等)形成的[集](https://baike.baidu.com/item/%E9%9B%86)成电路放在一块塑基上，做成一块芯片。而今几乎所有看到的芯片，都可以叫做IC芯片。



(3)电性测量：经过上述步奏，一片圆形的晶片上出现许多小格子，每一个格子就是我们希望得到的芯片的雏形了，之后需要测量一下加工完毕的片子的I-V,C-V等电气特性等，是有专门的测量仪器通过探针在打在两侧的金属或poly上扫描分析完成的，我做实验时候用的四个探针，不知道产业界如何。
(5)测试：顾名思义。与之前的电测相比，更具更仔细和有针对性。



半导体产业最上游是IC设计公司与硅晶圆制造公司，IC设计公司依客户的需求设计出电路图，硅晶圆制造公司则以多晶硅为原料制造出硅晶圆。中游的IC制造公司主要的任务就是把电路图移植到晶圆上。完成后的晶圆再送往下游的IC封测厂实施封装与测试。

IC设计可分成几个步骤，依序为：规格制定 → 逻辑设计 → 电路布局 → 布局后模拟 → 光罩制作。

「逻辑」设计图，由简单的逻辑门这类的逻辑元件构成

电路布局：利用软件的帮助，把逻辑设计图，转化成电路图（由半导体电路元件构成，如二极体、电晶体等）

**布局后模拟：**

再经由软件测试看看，是不是和当初「规格制定」是一样的结果

**光罩制作：**

把电路制作成一片片的光罩，完成后的光罩即送往IC制造公司。



IC制造的步骤

薄膜→光阻→显影→蚀刻→光阻去除，然后不断的循环数十次

**薄膜：**

镀上金属(实际上不一定是金属)

**光阻：**

在晶圆上涂上一层光阻(感光层)

**显影：**

用强光透过「光罩」后照在晶圆上。这样的话，除了「电路」该出现的部分，其余光阻的部分是不是都照到光了？

**蚀刻：**

把没有光阻覆盖的薄膜冲蚀

**光阻去除：**

把上面的光阻去除，留下的薄膜部分就是电路图

实际的情形是光罩是由好几十层构成的，而每层需要的材质也不一样。也就是说，薄膜那一层需用不同的材质。譬如说，SiO2。



晶圆完成品就被送往IC封测厂，实行IC的封装与测试。

**封装：**

封装的流程大致如下：切割→黏贴→焊接→模封。

切割：

第一步就是把IC制造公司送来的一片片晶圆切割成一颗颗长方形的IC

**黏贴：**

把IC黏贴到PCB上

**焊接：**

故名思义，把IC的小接脚焊接到PCB上，这样才和大PCB(如主机板)相容

**模封：**

故名思义，就是把接脚模封起来。最近很hot的题材-BT树脂，就是用在这里

硅晶圆制造除了和半导体产业有关，也和最近最热门的太阳能产业有很大的关系，像是绿能、中美晶的公司都是生产硅晶圆的







处理器后门：



CPU中存在某些特殊指令，制造商（例如Intel）并不对外公开，只有自己人才能使用

存在，做到这点太容易了。CPU是依存于外围硬件设计的，外围电路的样子是无法预测的。CPU没有办法建立起自己独立的通讯系统，自然就没办法激活什么。除非CPU被做成一个很大的模块，但这样就和成品电路没区别了，一开始就不会用的。

可如果用Intel芯片的非美国军用电脑被完整的得到了，粗看电脑是加密了，你没法用，但Intel可以在CPU上单独接个接口出来，用只有他们知道的指令打开数据接口，直接从CPU处理上导数据出来，这样就有可能绕过加密程序，直接获得被加密的数据。

就好比一个潜伏的间谍，上下级全都失联，然后还关在一个屋子里，除非有渠道通讯，不然是做不了什么的，



如果一个设备中，软件供应商跟cpu供应商是一家，例如在通信领域，像思科、爱立信、华为这样提供完整的软硬件解决方案，是可以做到做到后门的。纯软件后门 或者 专用后门逻辑+软件接口都好实现。

再说个，纯软件后门相对比较容易发现，怎么着总得占个线程（os上做手脚不好说，那得改内核吧），而硬件后门的确可以不用到线程，在总线和接口ip上都可以做手脚，但传出来的数据很难解析出来啥意思就是。



回到芯片后门，这其实算是一个安全领域的事情，只是碰巧和芯片的设计制造搭上点儿边而已



```
就从这个教授说起吧。Tanenbaum教授当初为了教学方便，写了个操作系统叫做MINIX，一种类似UNIX的操作系统（顾名思义MINI UNIX）。MINIX对于大众来说知名度有点不高，不过一说它是Linus当初开发Linux的灵感源泉，它就相当了不起了（看官，请您配合自然发出一声情不自禁的“哦”）。当然它本身也是一款非常棒的操作系统，否则当初Intel想在自己的芯片组内搞一个内嵌的操作系统，也就不会选择它了。
```

Intel把MINIX用在了什么地方呢？下图是Intel平台的一个框图，这里的平台可以理解成一个电脑的主板。组成Intel平台的主要芯片当然就是Intel自家的CPU了，除此之外，还有芯片组（chipset），有若干芯片组成。其中一颗北桥芯片上内嵌了一个CPU，连同在这个CPU上运行的软件（MINIX就是运行其上的操作系统），一起构成了ME（Management Engine）。这个ME几乎在所有比较新的Intel平台上都存在。

ME的功能和权限非常强大，强到什么程度呢？它有一条与平台上的网卡直接连接的专用通道，可以绕过主CPU监测、传送网络数据。只要主机插上电源，在系统休眠甚至关机的情况下，都可以被远程唤醒以执行特定的任务。Intel ME因为其所处的特殊位置，还可以绕过主CPU存取主机DDR内存中的任意数据，而它自己本身，即便是主操作系统也无法访问。它的软件部分在出厂时，就和BIOS保存在同一片FLASH上，并且采用了特殊的加密机制，除了Intel授权，其它人都无法对其进行修改。如果强行对FLASH芯片做非法修改，修改后的内容也无法被ME加载和执行。



黑客们在对Intel ME中的软件进行逆向分析的时候，发现了一些特有的字符串，而这些字符串被人熟识就是因为其存在于MINIX的源代码中，这才把MINIX的作者Tanenbaum教授置于风口浪尖，不得不写了一封公开信撇清自己。

包括联想在内的各大PC厂商反应还是非常迅速的，虽说被Intel这个队友坑了一把，不过还是非常负责的发布了相关平台的安全补丁。这篇帖子虽然说的是Intel平台的ME，但是PC处理器的千年老二也不能独善其身，AMD自从2013年起也推出了类似的技术，叫做the Platform Security Processor（简称PSP哈哈）。其实我们不妨脑洞开得大一些，在比PC更为普及的手机领域，各大平台是不是也有类似的技术呢？毕竟现在的手机都是不可插拔电池，并且标配WiFi、蜂窝等各种通信技术，对于类似的后门支持有着天然的、无与伦比的应用优势。面对如此强大的组织，我们个人能做的，也许仅仅就是希翼它们DONT BE EVIL吧？















IT产业是解决万维网的产业

网状结构 不能分成树状结构的模块  cpu就是  耦合度很高  互相之间关系复杂  就像大脑

物理实现复杂  有上亿个晶体管  1000个晶体管  差不多一个加法器

发动机是工业的心脏（汽车）——不进口 我们汽车产业就没了
cpu和操作系统是信息产业的心脏 
高端控制系统（高铁，飞机，发电厂）——一带一路促进美国高端控制系统的出口
精密仪器（B超）

不是定理的问题  都是工程的问题  只能一级一级的试错  试错是需要时间的 不在科学原理， 在技术完善   就是工程  一点点的磨  耐心（三高实验  10辆汽车  不同环境  可以用了  没人买  30辆车没问题  样本太小  没有科学定理保证）  哪个科学原理都懂  都是工程问题  几十年一点点改  就要是错  时间是核心技术产品的通货

北斗： 三份冗余  地面加速器  模拟太空环境  全国就两台  做一次实验要排队  没有以年为单位的试错过程没有质的发展  10年为单位  我支持你十年  你可以一直赔钱  任何两三年可以做出来的东西门槛都不高 利润都不高

你不是不优秀  你只是不够卓越

人家一个礼拜上40小时班 我们上60个小时  我们农民工  我们的南极站  我们两弹一星就是这么干出来的



算法（计算中心）  操作系统（软件所）

大三的时候  我会教你们怎么造cpu

嵌入式操作系统的单一应用  通用操作系统的简单应用





一级一级的  跟你写作业一样



攻击  22%来自漏洞   70 80%来自后门（就是设计好的后门）

苹果和谷歌

英特尔和微软





写java虚拟机  性能提高  浏览器  图形系统 

技术不重要  重要的是技术能力



wps

深度操作系统

图形系统   

龙芯操作系统  java虚拟机  浏览器

















CPU的研制是一项复杂的系统工程。对于CPU，由于要实现各种复杂逻辑的执行，它的设计是所有集成电路中最复杂的；同时，它的物理实现也极为复杂，要使用最先进的纳米级工艺；更重要的是，它的软件生态更加复杂，我们也很难拥有优秀的解决方案。





在手机里面，CPU体现为一个IP。

这个问题本身就是个伪命题，因为我国手机cpu设计能力还不及在大型用户端cpu。
你看到的所谓手机cpu其实是个soc芯片，里面包含了cpu，基带处理器，gpu，视频编解码器，内存控制器，加上各种接口控制器，电源管理等。其中的cpu基本都是用arm公版，根本谈不上什么设计，只能算是整合，顶多像华为这样技术实力深厚的可以进行后端的优化。
而在龙芯，申威，飞腾这些国产cpu，尽管技术路线不同，但起码从微架构层面到最终制造的物理版图都是自主设计的，技术难度与工程复杂程度根本不是一个数量级。

 

因为ARM存在，手机SOC设计比电脑CPU设计，难度低了不止一个level！

 

A73的CPU、mali的GPU，再来一个基带、来一个ISP……装一起就是一个SOC！即使是骁龙835的 Kyro 也是A73的小改版而已。

X86的CPU的寄存器、计算单元、逻辑单元这都可都是要自己设计的！

 

要是Intel也学ARM这样教人做CPU，那联想也是可以拿出和AMD旗鼓相当的CPU 产品的！

 

国产没有纯自产的cpu，你以为什么华为高端SoC是什么？arm的底层指令集合，arm的驱动，arm公司提供的gpu，图像处理器。他有的只是自己的架构，架构能干什么？一个好的架构是把所有的硬件的效果发挥到最好的位置，还有外挂的别人家的基带。为什么国产没有好的电脑芯片，首先电脑芯片和手机芯片完全不是一个级别，手机芯片再怎么强劲也不可能打败电脑，他们所做的不是一个数量级的运算能力。我们没有好的电脑芯片，在于硬件方面你没有先进的技术，把功耗降低就需要把做工的nm级减小，设计一个好的架构不是一两天就能设计的，仅仅是cpu的指令级别完全国产，光是设计就要很长的研发时间。至于外挂的gpu所谓的显卡，全世界就两家独大，英伟达和amd，为什么因为他们有自己的团队科研机构，并且专门研究这一方面的科技，国内只是为了赚钱的公司想做到这一点不可能

 

 

 



5，那么有人说，CPU不就电脑里面用吗？不是，每个在座的人兜里面都有一个或者多个CPU。手机里面也用，现在像家里面的电饭锅、洗衣机、电视、数码相机，包括各种工业控制系统，高铁、电站都用CPU，甚至马路口的红绿灯都是CPU控制的。所以它是面很广，支撑产业的东西，它是一个基础性的东西，就像钢铁一样。

6，结果后来发现，它坏是因为CPU里面的后门引起的。以色列来炸之前，通过后门把你雷达给破坏，然后它炸完之后就好了。伊朗的核离心机，2013年的时候有几千台被损坏，不是电脑被损坏，而是核离心机的控制系统让离心机瞎转，转坏为止。那个伊朗的核离心机是物理隔离的。什么是物理隔离？我们说把网线拔掉，无线模块要拆掉，不是关掉。在物理隔离的情况下，还是有后门。

7，美国的芯片、CPU不卖给我们，我们一大批企业，大家脑袋中可以想象得到的所有高技术企业，电子方面的，都得关门，而且撑不了一个月。

8，CPU是一个巨复杂系统，为什么我们就没有呢？难！复杂！我们做CPU叫中央处理器，它有一个叫通用处理器。通用处理器，我可以上网浏览，我可以办公上office，我可以看片，然后我还可以显示各种图形，什么都能干。相当于要求我们每个人是个全才。



那么CPU它有好多种表现方式，像我们的先辈做的，为两弹一星造计算机，一个CPU可能这么一个大屋子，放一个，速度还不快，每秒可能只有几万次。后来Intel，我们叫微处理器，把它做到一个芯片里面，在手机里面，CPU体现为一个IP（知识授权），这里面可能大家有个疑问，说我们国家这个手机的CPU做的很好，电脑的CPU怎么就做不好呢？其实这个话说的有点偏颇，我们手机的很多处理芯片是自己做，但是其中的CPU，无一例外都是买了国外的CPU，比如说把它的源代码买来，经过一定的物理设计，让它去生产，编成芯片，我们手机的CPU做的非常多，一年卖几亿片，但是CPU都是国外的，用的ARM这个企业的，所以现在主要提供CPU的一个是Intel，以芯片的方式，一个是ARM，它是以IP的方式，   

第二句话CPU是国家大宗战略产品，

第一是大宗，它不像原子弹，不像航天飞机，航天飞机和原子弹它是战略的，大家不会比着卖，我卖一个，你卖一个，还砍价格是吧。衣服和鞋是大宗的，不是战略的，我可以买你的，还可以买它的，

大宗和战略连在一起，这样的东西不多，CPU是其中一个。

我们回顾一下就是建国初期的毛主席，周总理那一代人，一定要把钢铁工业发展出来，没有钢铁就没有工业，

我们今天完全可以说没有CPU就没有信息产业。它就像钢铁支撑工业一样来支撑我们的信息产业，所以它就是基础。     





美国芯片，CPU不卖给我们，我们一大批企业，大家脑袋中可以想象得到的所有高技术企业，电子方面的都得关门，而且可能撑不到一个月，所以为什么说（CPU）他是国家大宗战略产品。我们必须要自己有。    





接下来，胡老师讲述了我国CPU尤其是龙芯的发展现状。他讲述了自己与龙芯走过的艰难历程，并生动地比喻为“爬楼梯”。

在十二五期间，龙芯在武器装备类应用中不断试错，终于使得自主基础软硬件基本可用。

在十三五前期，龙芯在办公类应用中不断试错，一定程度上突破了基础软硬件优化和兼容性的瓶颈，进而达到了可用的水平。

当下，龙芯在批量应用中不断试错，预计CPU通用处理性能在2020年前后逼近国际主流CPU的天花板，同时实现操作系统在不同主板以及CPU上的兼容，并以用户体验为中心，展开梳理和优化以打造集约型的系统，使用户体验有实质性的提高。

胡老师展望，在2025年，龙芯将满足开发市场应用的条件，在开发市场中形成自主的生态。

回忆起18余年的龙芯开发路线，胡老师总结道，当初就自主研发和引进技术两条路线各派存在着激烈的斗争，但是最终大家达成共识，提升国产硬件性能和改善软件生态成为了焦点。

最后，胡老师探讨了我国CPU的发展道路。习近平曾经说过，我们要“构建安全可控的信息技术体系”。

中国IT产业的根本出路在于建立独立自主、安全可靠的体系，为了国家安全和产业发展，我们要掌握技术和产业的主动权。如果我们不能打造出属于我们自己的IT生态，那么我们也永远无法实现中华民族的伟大复兴。

胡老师告诫我们，中国去年GDP已达到美国的70%，美国很可能进行产业战略欺诈和贸易压制。在这时，我们更要警惕西方摧毁我们的创新能力，能力一旦丧失，恢复至少需要三十年以上。他认为，科学技术十分关键，但是技术能力更加重要，因为工程能力只能在实践中多轮试错中才能形成。更加关键的是，高复杂系统能力建设需要以30年为周期，如自主CPU研制、太湖之光超算的研制，于是时间成为制约我国核心技术发展的主要因素。

胡老师总结龙芯CPU的发展道路，也面临过诸多岔路，如市场化与学院派之争、自主研发与引进技术之争、建生态与做产品之争等等。但这些争论并不能打击龙芯人的信心，要决心打造全球的第三个大生态，以安全可控为主题，以产业发展为主线，以体系建设为目标，坚持企业主体、自主研发、体系建设，走好这条前景光明、对国家和人民好处最大的道路！











## 博文





9，我是2001年开始做龙芯CPU，当时我们的所长李国杰院士给了我100万，我们拿100万人民币做了一个原型系统，一种叫现场可编程的逻辑（门阵列）。把那个设计烧进去，把操作系统哗哗跑起来了，我记得那天是2001年8月19日。登录进去，我给李老师发了一个邮件，然后就拿那个成果找科学院汇报，要了500万，加上计算所匹配500万，总共1000万，做个龙芯1号。

10，龙芯2号刚出来，2002年的时候收到一封邮件，那个邮件是一个杭州市的退休工人。他给我发来邮件，说我报纸上看你们龙芯出来了，我很高兴，我是个退休工人，我的工资也不高，但是请你给我一个你的银行帐号，我要给你们捐1000块钱。

我们对CPU这个东西，都有情感。

龙芯2号做出来，有个很大的好处，使得我们推动国家说要做，因为证明是能做的。做到2005、2006年的时候，当时觉得我们CPU不能光是做，要用、要去推，不能停留在纸面上。

我们推了几年，大概到2009年的时候，我记得当时有一个场景，我是很难忘。就某个大型的设备用起来了，客户是国内一个有影响力的机构，说要开个推介会，我就推荐你的自主CPU做的一个控制平台。说我发了六七十张请帖，但是我怕很多人不来，你能不能到时候带十几二十个学生在后排坐着，帮我撑撑场子。然后两点开始，我一点四十五到。当时那个场景把我惊呆了，全站着100多人。因为坐不下，那个屋子就六七十人。领导讲话，第一句话就是，这是历史性的一天，我们从此可以用自主CPU了。



2015年，龙芯转亏为盈，逐渐开始适应市场。2016年研制成功的龙芯3A3000处理器被用在了北斗二代卫星的成功首发上。

龙芯3号的诞生，象征着从上天卫星的抗辐照芯片到入地钻井的耐高温芯片，龙芯都已经有足够的能力涉足国家安全设备领域的深度制造，也让龙芯成功打开了行业领域应用的市场大门。

“我们是走自主研发道路，还是走引进技术的道路？路上的诱惑很多，后来我搞明白了，能力最重要，技术不重要。所以我们都是说，我们要坚持自己做，每一行源代码要自己写起，我一行也不引进。你只有自己掌握了核心技术，才能有整个产业的主动权和主导权。就是我们做产品还是建生态？你要做产品，你在Wintel体系里面，我做个芯片卖，或者做个电脑卖，叫做产品。建生态，就自己来一套，走自己的路。现在主要的IT产业体系，两大生态来支持，一个英特尔+微软，一个Arm+安卓。**我们的目标一定是建世界上第三大生态体系！**”









## 记录



我回忆一下我从做龙芯开始到现在，经过了三个岔路口，就

第一个岔路口就是走市场化道路还是走学院派的道路？     刚才说了CPU很复杂，企业是做不起的，你让企业投入十年，一分钱不赚就做研发，没有企业做，中国到现在也没有企业有能力做这样的事情，必须国家投入研发。但是投入研发都在科研院所，在高校，怎么办？那跟市场隔了一张皮。我们得到市场中去，要所有人，相关的核心技术人要脱离，从体制内脱离出来，要不在乎体制内那些职称，各种评审，然后专心致志去赚钱。这是一个岔路口，我觉得我们走过来了。    

第二个岔路口，我们要走自主研发道路还是走引进技术道路？路上的诱惑很多。后来我搞明白了，能力最重要，技术不重要。我们要坚持自己做，每一行源代码要自己写起，我一行也不引进。你只有自己掌握了核心技术，才有整个产业的主动权和主导权。     

第三个岔路口，就是我们是做产品还是建生态？什么叫做产品呢？你在Wintel体系里面做一个芯片卖，或者是做一个电脑卖，这叫做产品。建生态就是自己来一套，走自己的路，现在主要的IT产业体系，两大生态来支持，一个是Intel加微软，叫Wintel，一个ARM加安卓叫AA体系，或者双A体系，我们的目标一定是建世界上第三套大的生态体系。       



龙芯现在做到什么程度呢？两句话，第一句话CPU光从系统性上来说，我们在半空了。什么叫半空呢？假设国外的主流产品在天花板了，那国外的主流产品，PC、服务器，我们说通用型的，每一代性能提高一点点，基本上到头了，我们在半空了，再下一代我们大概逼近天花板，性能就这样。     

第二句话就是我们只要自己跟自己进行软硬件磨合，我们以用户体验为中心，完全可以在用户体验上超过国外系统。一个例子就是我们某个大型的数据库系统，原来用国外的X86服务器处理完好大的数据，几个T的数据，需要50分钟，然后在龙芯上直接迁过来，我们通过垂直的磨合和优化，我们干到了80秒，谁的快？     

判断技术是否先进的标准，不是看它跟美国人跟的紧不紧，而是它看跟应用结合的紧不紧

那么做了这么多年龙芯已经有点体系了，给大家几个数字，

一个是用龙芯的芯片客户有500多家，每天都在用，我们通过卖CPU我们可以盈利，世界上盈利的CPU企业不多。     

第二龙芯下一个客户中，基于龙芯的CPU，做软件研发，做应用研发，做硬件研发的人已经有几万人，那么有个小生态了，当然还很小。 要做自己的体系来支撑产业发展，这条路当然是很难走的。就像我们路上有很多的沼泽沙漠，有豺狼虎豹，有雪山草地，但是这条路走通之后前途最光明，这条路走通之后对国家和人民的好处最大，这是这样一条路。     

现在看来我觉得这条路走得通了，我现在干了龙芯17年了，再干13年，30年的时候我估计我们可以看到有一个生态。     

建立发展自主的CPU产业，建立自主可控的信息产业体系，是国家安全的需要，也是产业发展的需要，而且我们已经有了一定的能力，再也不用怀疑我们能不能做成这件事了。     

习主席要求我们撸起袖子加油干，但还要求我们一张蓝图绘到底。我把它翻译成就是撸起袖子加油干加上耐着性子坚持干。     

当年毛主席在党的七大上讲了一个愚公移山的故事，他说愚公要搬掉两座大山，我们中国人民也要搬掉两座大山，一个是帝国主义，一个是封建主义。当时他很动情地说，说我们这代人搬不完，我们的下一代去搬，当时朱德同志就说，我们这代人就要搬完，该打的仗，我们这代人要打完。

我们现在也是两座大山，一个是国家安全受制于人，一个是产业发展受制于人，那我们这一代人，我相信我们这一代人也要搬完，不能留给下一代了。     

所以最后啊，我用毛主席的一句话结束我今天的报告，我们正在前进，我们正在做我们的前人从来没有做过的极其光荣伟大的事业，我们的目的一定要达到，我们的目的一定能够达到，谢谢大家。  





胡伟武：写的是我们以饱满的热情，决心在春节前，在龙芯2号，verilog上运行一个程序要通过，不调试成功誓不回家。     

反映了我们当时的那样的一个情况，就是春节不回家，五一十一都不回家，就是把它做出来再说。做龙芯的时候就是很苦的，就是熬夜。完全是靠熬夜，熬夜熬出来的。     



龙芯呢，现在我们主要是推行业应用，比如说党政军，能源，交通，金融，这些涉及国家安全和国民经济安全的行业应用，当然也有一些偏向消费的，比如说马路口的红绿灯上都有我的芯片，家里的有些电视机上也有我们的CPU，甚至北京有一些小区，一些充电桩上都有，行业应用它不体现在电脑上。 

那为什么要这么做呢？就是我自己回顾了我过去17年的路，我觉得弯路比直路多，我每次取得先进一点，或者研发上或者市场上，就觉得自己很厉害，就想大跃进，大踏步的前进，结果就摔跤，我犯了很多“左”的错误，所以我现在很清楚了，2020年前，龙芯就是争取成为行业型的CPU龙头行业，那么2030年的目标才是支撑产业型的，现在看来我自己达到第一个目标，应该是问题不大了，能不能达到第二个目标？还是要努力的。     

龙芯电脑我们有开发者计划，是可以买的，龙芯电脑现在可以这么说，你如果上网，办公，看片，处理一般的事务很流畅，没有问题了，但是你买回去之后，你玩不了股票，你也玩不了游戏，所以我说开放卖，大家会骂我的，一定要等我们用的人更多，把生态做起来之后，越来越多的软件来支持龙芯，包括游戏软件迁过来，股票软件迁过来，我们才可以面向开放市场。 



因为它有灵魂，组织的灵魂就是理想和作风的建设，我们没有骨干的流失。我们刚开始办企业的时候，我们也没钱，给大家钱都很低，比如说我们非常核心的骨干，可能年薪才十几二十万，别的企业拿百万年薪挖他，他挖不走。     

郑若麟：那他怎么抵御百万年薪放在一边，这里才十万？     胡伟武：所以我讲一个基本的道理，就是当年的红军和八路军是不发军饷的，但是他比国民党，比日本人的军队还有战斗力，就是要有理想作风。     那龙芯的理想作风，就是用毛泽东思想来武装这个团队。首先解决为谁做CPU的问题，像龙芯现在队伍可以发展到今天，龙芯孵化了企业，企业能盈利，以后也可能会上市，如果为了赚钱做龙芯，这是一种做法，我觉得我们这有很多人可以过上比较舒服的日子。但是如果为人民做龙芯，这个路还长得很，可能像毛主席说的万里长征只走了第一步，所以这是第一个为谁做龙芯的问题。     

第二就是艰苦奋斗的问题，我要给它一个基因，这个基因是双螺旋结构，一条螺旋就是以毛泽东思想为核心的党建文化，另外一条就是以道德教育为基础的传统文化。     我是通过导师教到这个东西，然后我把它传下去，龙芯就是培养了，我自己比较得意的就是培养了这个（灵魂），比如说我的学生很优秀，最好的研究生，博士生都留下来了。     

郑若麟：好，太感人了。     宋涛（金山办公软件副总裁）：主持人，胡教授您好，作为国产基础办公软件，其实WPS也是走了将近30年的路，这条道路确实也很艰辛。     龙芯作为国产的CPU的厂家，在软件系统上的生态链的打造上是什么样的看法？下一步准备怎么做？     胡伟武：首先金山的成功给了我们前进的动力，金山的路实际上也是龙芯未来要走的路，金山干30年了，我才干17年，这是第一点。     第二因为我们也是跟金山其实有很多合作，我每天办公用就是龙芯的电脑，上面装的是金山的WPS，应该说龙芯跟金山也是战略伙伴，我们的软件生态，联合了像金山这样的企业，金山是很有代表性的，当然我们还有操作系统（合作伙伴），数据库也有合作伙伴，

那对龙芯来说要有一种开放的心态，就是我们大家一起来做个生态出来，应该说软硬件嘛，在应用的牵引下，这几年基础软硬件发展还是不错的，但是要磨合，深入磨合的空间还是非常大的。我觉得是。     



胡伟武： IT产业发展不平衡首先体现在人才不平衡上， 就我们IT的应用人才数以百万计，从业人员数以百万计，但是基础的人才我们数以十计。

比如说我们跑Java应用的那个Java平台叫Java虚拟机，我们中国会写Java虚拟机的人，可能2010年办企业的时候10个都不到，现在可能有几十个了，就这么多，高校不教他，也教不起，因为它是个基础平台。所以我的建议就是我们要重视基础。

 像我一个汽车专业，培养一堆驾驶员一样，汽车专业就应该教学生怎么造汽车啊，不是培养驾驶员，驾驶员是驾校干的事情，那我们应该教学生怎么造计算机。 我立志要做一个平台，争取让所有的高校能教学生怎么造计算机，第一我们把龙芯CPU的硬件源代码开源了，对高校都开源，你拿去教学生，用我们的实验平台，我可以教你，我们设计课程，你按下电源开始到整个操作系统起来这个过程给你教明白，里面怎么回事，这是一个。     

另外呢，我自己确实是在中国科学院大学，从本科硕士博士，重新编写了我们计算机体系结构教材，我们每年还有龙芯杯的开源大赛，这个开源大赛不是写软件，是怎么写CPU的能力大赛。 



杨强浩（中国电子科技集团公司信息安全专家）：前不久的Intel公司的CPU出现了很重大的信息安全的漏洞，实际上对我们整个中国的IT产业，甚至对世界的IT产业造成了很大的冲击，我们随着龙芯CPU在中国这个IT行业的推广，能够把我们整个中国的IT行业的信息安全水平提高到什么样的一个高度？     

胡伟武：我觉得信息安全分两个层次，一个叫自主可控，一个叫安全可靠，我们要什么时候做到安全呢？就是自主可控加安全可靠才安全，这句话看起来像外交辞像官话，但是我分开讲，自主可靠是保证没有后门，安全可靠是看住前门。     我们有关部门的研究表明，我们每年在网络上，

中国的用户受到网络冲击，百分之七八十来自后门，百分之二三十来自漏洞，像你刚才说Intel有很大的漏洞，所谓的漏洞就是我设计者没想到，然后不小心。后门我故意埋在这里了，我以后永远不会打补丁给你补上的。     

那么龙芯呢，我们过去重点强调了自主可控，用户访问系统的内存空间的问题，我们龙芯有专利，就是我可以对它进行很多保护，我不同的空间用不同的保护，尤其是我们在下一代正在研制的3A4000 CPU里面，同时我们做了很多访问控制，确实过去强调自主可控多一点，强调安全可靠少一点，我们正在努力的，下一代产品就会做进去。     

观众提问：前几年有一个消息说Intel对我们国家进行了CPU的禁运，然后没过多久我们的超级计算机用了全部国产的CPU，也做到了世界第一，

申威那个团队我很清楚，它是2002年开始做的，做到现在也是十几年的积累才做到世界第一，那是一个非常扎实的团队，踏踏实实前进，稳步推进第一代第二代第三代，跟美国的制裁没关系。

另外你仔细去查一查，我们做出来（超算）芯片这个团队，不是当时受美国制裁的团队，如果说美国一制裁我们就做出来，那这个太容易了一年就做出来，那不叫CPU，那就是简单的东西，它是一个长期积累的结果。

而且我们跟他形成互补，他们做高性能机，高端的服务器，我们冲服务器、PC、中控，把这两个加起来，这也是我们国内高举着自主旗帜的两个CPU团队。所谓自主就是我们从头开始自己研发，而不是靠引进。

所以呢，千万不要以为美国一制裁我们就行了，十几年的积累啊。     

“从97年UCDOS，WPS开始至今，中国的软件人就没有搞出一个属于我们自己的计算机全民使用的操作系统，为什么？从十年前东南亚的那场大水开始，硬盘，内存的价格就一直处于疯涨阶段，是我们国内的技术制造不了这些硬件么？这些硬件和软件问题，涉及面之广，从家庭个人到国家安全国防，为何没有改进，希望在哪一年出现改观？”     

胡伟武：我觉得这个问题问的很好。宏观上，我们改革开放，今年第四十年了，我们是快速发展，就像打仗一样，快速推进的过程中，有些难攻的山头我们先绕过去，哪些山头绕过去了呢？CPU绕过去了，操作系统绕过去了，因为当时为了快速发展，反正后面有一两个山头没攻克，先绕过去再说，但是现在我们的后方如果再不回头收拾，后方不稳了，所以我们要收复一些失地，所以过去应该说我们在这方面确实是投入不足，包括CPU在内的基础软硬件投入不足，这是宏观上。   

你看我们发展的结果是我们IT产业PC事业第一，手机很好，微信，电商这都是我们的成果，我们不能忽视这些，现在我们要回过头来打了，所以时机是到了，这是一个。     

第二我们过去发展中，我们政府也有投入，想把操作系统发展起来，想把CPU发展起来，但是我们对产业的规律认识不足，我们叫缺芯少魂，我们这个叫芯，软件叫魂。魂是要附体才有价值的，

软件这个东西啊，首先要破解这个商业模式的难题，如果还用当年微软的模式卖Licence，我们能赢吗？还是我们应该用Google的模式？这个问题要先破解。     

技术上，操作系统跟CPU是一对欢喜冤家，肯定是要捆绑式发展的，那我们现在也跟国内的不少操作系统企业，我们在探索这条新的路子，我相信再有三四年我们会看到这个平台出来，就中国的有比较强的技术特点的，中国自己的操作系统。     

夏培肃院士是中国计算机之母，是中国计算机事业的奠基人之一，也是您的老师。     胡伟武：我们都管她叫夏先生，夏老师是引导我的人生的，我记得我博士毕业的时候是很困难的，当时我说过一句话，只要夏老师还在科学院我就不离开科学院。第二句话我这辈子绝对不会给外国资本家打工。     为什么我会有这种话呢？夏老师真的是在我身上花了很多心血来培养我的，比如说我的博士论文，她改了八个月，26稿，手把手的，我想我自己也是导师，我是真的做不到。     我在国际会上或者是会刊上发表了很多的论文，夏老师不允许我署她的名字，她每次都是说她没有实质性工作。我做CPU之后每半年我跟她汇报一下，有几句话是刻在脑子里面，她说我们当老师的就是人梯，你那个梯子要是太低了，没人愿意爬你的，你自己要不断长高，大家才能攀着你往上爬。     后来我零几年的时候，CPU研究做的不错了（夏老师）反复的强调你要拿去用，要做产业化。所以夏老师是我的引路人。     她是2014年去世的，那时候她91岁，她躺在病床上我去看她的时候还跟我说，她说我这辈子最大的心愿就是发展好中国的计算机事业，我们这一代人没有做好，你们要做的比我好。我们是有嘱托的。     我的老所长李国杰院士，他说了一句话，我也终身难忘，他说我的导师夏老师90岁了干不动了，我今年也70岁了，也马上干不动了，如果到胡伟武这一代，中国的CPU还发展不起来，我们的IT产业就没戏了，所以我们这些人是背着十字架在沼泽地里面走，你不能停下来，停下来就陷下去了。     

郑若麟：还有黄令仪老师，都是计算机的前辈。     胡伟武：黄老师是很早，他是零几年的时候是工作50周年了，然后她参加计算所第一个工作就是两弹一星上的一个计算机，为那个计算机做集成电路，做芯片。后来有一次我们龙芯有一个芯片就是类似于像两弹一星这样的任务中用的。她是老同志嘛，我请她把关，我在食堂里面吃早饭我跟黄老师说，我说黄老师，这个芯片很重要，也是（类似）两弹一星上用的，你好好把把关，

结果黄老师脱口而出：她说胡老师，我这辈子最大的心愿就是匍匐在地，擦干祖国身上的耻辱，她后来说她说我是看见过我的同胞被日本人的飞机炸死的，我们是被日本人搜过身的。     

所以我就说任何事情没有无缘无故的爱，也没有无缘无故的恨，我们能够坚持做这个事情完全来自于上一代的传承，传到我们这一代了，刚好这个东西交到你肩上，你不扛也得扛。    

我想起一句话，有一种快乐叫坚持，有一种胜利来自于煎熬，我觉得这句对我们是很贴切，我是每一天都是很煎熬的，这个也很快乐，就觉得当我们看到龙芯用起来，或者性能实在提高，或者一个bug解掉，确实是非常快乐的一个事情。     

我相信我们的后人会像今天我们崇敬长征的英雄，崇敬抗美援朝的英雄，崇敬两弹一星的英雄一样，来崇敬今天在建立我国自主可控的信息产业体系道路上，历尽艰难险阻完成新长征的我们。



1）什么是指令集

参考：

<http://product.pconline.com.cn/itbk/bjbzj/notebook/1109/2522116.html>

所谓指令集，**就是CPU中用来计算和控制计算机系统的一套指令的集合**，而每一种新型的CPU在设计时就规定了一系列与其他硬件电路相配合的指令系统。而指令集的先进与否，也关系到CPU的性能发挥，它也是CPU性能体现的一个重要标志。

通俗的理解，指令集就是CPU能认识的语言，指令集运行于一定的微架构之上，不同的微架构可以支持相同的指令集，比如Intel和AMD的CPU的微架构是不同的，但是同样支持X86指令集，这很容易理解，指令集只是一套指令集合，一套指令规范，具体的实现，仍然依赖于CPU的翻译和执行。就像，同样是一段C语言代码，我们可以用不同的编译器去编译得到不同的可执行文件，当然，自然而言，效率也可能不一样。

（2）指令集分类：

从大类来分，一般将指令集分为精简指令集和复杂指令集。

精简指令集，即RISC指令集reduced instruction set computer：（<http://baike.baidu.com/view/981569.htm>）

这种指令集的特点是指令数目少，每条指令都采用标准字长、执行时间短、中央处理器的实现细节对于机器级程序是可见的。

复杂指令集，即CISC指令集Complex Instruction Set Computer：（<http://baike.baidu.com/view/1177592.htm>）

在CISC微处理器中，程序的各条指令是按顺序串行执行的，每条指令中的各个操作也是按顺序串行执行的。顺序执行的优点是控制简单，但计算机各部分的利用率不高，执行速度慢。

通俗的理解，RICS指令集是针对CISC指令集中的一些常用指令进行优化设计，放弃了一些复杂的指令，对于复杂的功能，需要通过组合指令来完成。自然，两者的使用场合不一样，对于复杂的系统，CISC更合适，否则，RICS更合适，且低功耗。

注意：当初本没有RICS和CISC之分，最开始，Intel X86的第一个CPU定义了第一套指令集，这就是最开始的指令集，后来，一些公司发现很多指令并不常用，所以决定设计一套简洁高效的指令集，称之为RICS指令集，从而将原来的Intel X86指令集定义为CISC指令集。所以，并不是先有RICS后来才有CISC，而是反过来的。

典型的RICS指令集的CPU有：ARM、MIPS等

典型的CICS指令集的CPU有：Intel的x86指令集，以及现在的AMD的x86-64指令集。PS：AMD的兼容CPU也支持x86指令集，反之。

（3）指令集发展：

上面的分类是一个大致的分类，指令集是一直在发展的，在CISC指令集中，慢慢的发展了一系列的指令集：

\1. X86指令集：

X86指令集是Intel为其第一块16位CPU(i8086)专门开发的，IBM1981年推出的世界第一台PC机中的CPU—i8088(i8086简化版)使用的也是X86指令，同时电脑中为提高浮点数据处理能力而增加的X87芯片系列数学协处理器则另外使用X87指令，以后就将X86指令集和X87指令集统称为X86指令集。

\2. MMX指令集：

1997年Intel公司推出了多媒体扩展指令集MMX（MultiMedia eXtensions），它包括57条多媒体指令。MMX指令主要用于增强CPU对多媒体信息的处理能力，提高CPU处理3D图形、视频和音频信息的能力。

\3. SSE指令集：Streaming SIMD Extensions

由于MMX指令并没有带来3D游戏性能的显著提升，所以，1999年Inter公司在Pentium III CPU产品中推出了数据流单指令序列扩展指令（SSE）。SSE兼容MMX指令，它可以通过SIMD（单指令多数据技术）和单时钟周期并行处理多个浮点来有效地提高浮点运算速度。

4. SSE2指令集：

在Pentium 4 CPU中，Inter公司开发了新指令集SSE2。这一次新开发的SSE2指令一共144条，包括浮点SIMD指令、整形SIMD指令、SIMD浮点和整形数据之间转换、数据在MMX寄存器中转换等几大部分。其中重要的改进包括引入新的数据格式，如：128位SIMD整数运算和64位双精度浮点运算等。

5. SSE3指令集：

相对于SSE2，SSE3又新增加了13条新指令，此前它们被统称为pni(prescott new instructions)。13条指令中，一条用于视频解码，两条用于线程同步，其余用于复杂的数学运算、浮点到整数转换和SIMD浮点运算。

6. SSE4指令集：

SSE4又增加了50条新的增加性能的指令，这些指令有助于编译、媒体、字符/文本处理和程序指向加速。

7. 3D Now!扩展指令集：

3D Now!指令集是AMD公司1998年开发的多媒体扩展指令集，共有21条指令。针对MMX指令集没有加强浮点处理能力的弱点，重点提高了AMD公司K6系列CPU对3D图形的处理能力。由于指令有限，3D Now!指令集主要用于3D游戏，而对其他商业图形应用处理支持不足。

8. EM64T指令集：

Intel公司的EM64T（Extended Memory 64 Technology）即64位内存扩展技术。该技术为服务器和工作站平台应用提供扩充的内存寻址能力，拥有更多的内存地址空间，可带来更大的应用灵活性，特别有利于提升音频视频编辑、CAD设计等复杂工程软件及游戏软件的应用。

9. 3DNow!+指令集：
在原有的指令集基础上，增加到52条指令，其中包含了部分SSE指令，该指令集主要用于新型的AMD CPU上。

\10. AVX指令集：

Intel公司将为Sandy Bridge带来全新的指令扩展集Intel Advanced Vector Extensions (Intel AVX)。AVX是在之前的128bit扩展到和256bit的SIMD(Single Instruction, Multiple Data)。而Sandy Bridge的SIMD演算单元扩展到256bits的同时数据传输也获得了提升，所以从理论上看CPU内核浮点运算性能提升到了2倍。

总结：可以看到，CPU指令集是一只在不断发展的，随着需求的不断增加，指令集也在不断扩展，从而提高CPU的性能。RICS指令集一般用于嵌入式等场合，所以指令集并没有太多的扩展。
