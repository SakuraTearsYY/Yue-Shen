
use master
go
-------
if exists (select * from sys.databases where name='BookStore')
drop database BookStore
go
-------
create database BookStore
go
------
use BookStore
go
--图书信息

create  table  Book 
(
	BookID int primary key identity(1,1),--图书编号
	BookIndexImg varchar(max)not null,--主页图片路径
	BookName varchar(50) not null,--图书名称
	BookDetailsImg varchar(max) not null,--详情图片路径
	BookDetails varchar(max) not null,--图书简介
	BookPrice float  not null,--售价
	BookRoost varchar(2) not null,--上架状态 bit check(0='是' or 1='否')default(0)
	BookStock int not null,--库存
)

if exists(select * from sys.procedures where name ='Book_Sel')--图书详细信息查询
drop proc Book_Sel
go
create proc Book_Sel @BookID int =0
as
	if(@BookID<>0)
		select *  from Book,BookType where BookType.BookTypeID = Book.BookTypeID and BookID = @BookID 
	else
		select *  from Book
go
exec Book_Sel 

if exists(select * from sys.procedures where name ='Book_Add')--图书详细信息查询
drop proc Book_Add
go
create proc Book_Add @BookIndexImg varchar(max),@BookName varchar(50),@BookDetailsImg varchar(max),@BookDetails varchar(max),@BookPrice float,@BookRoost varchar(2),@BookStock int
as
	insert into Book values(@BookIndexImg,@BookName,@BookDetailsImg,@BookDetails,@BookPrice,@BookRoost,@BookStock)
go
exec Book_Add 'Img/img/iimg/3/2.jpg','说南宋','Img/img/iimg/3/1.jpg,Img/img/iimg/3/2.jpg,Img/img/iimg/3/3.jpg,Img/img/iimg/3/4.jpg,Img/img/iimg/3/5.jpg','本书在台湾出版后曾遭蒋介石严厉禁毁，传世版本极为难得。此次出版依据国民党《中央工作日记》的机密档案中寻获的版本，并由刘鄂公之子整理核定，故尤显珍贵。',34.0,'0',500
exec Book_Add 'Img/img/img/43.jpg','那一世，我遇见了你','Img/img/img/44.jpg,Img/img/img/45.jpg,Img/img/img/46.jpg,Img/img/img/47.jpg,Img/img/img/43.jpg','仓央嘉措，西藏*富传奇色彩的达赖喇嘛，他的爱情，穿越繁闹的尘世。固化的伦理、无涯的时间，当遗落在雪域的那一段时光被重拾，他则如一束石化的格桑花，再不向四季起誓，得了永恒。',50.0,'0',60
exec Book_Add 'Img/img/iimg/2/1.jpg','傲骨','Img/img/iimg/2/1.jpg,Img/img/iimg/2/2.jpg,Img/img/iimg/2/3.jpg,Img/img/iimg/2/4.jpg,Img/img/iimg/2/2.jpg','(知名作家白饭如霜青春职场力作，唐家三少、沧月、陆琪等畅销书作家鼎力推荐！在现实法则中肆意蓬勃，在尔虞我诈中心如赤子，所有的极限施压，伴随的往往都是成长！）',55.0,'0',70
exec Book_Add 'Img/img/iimg/4/1.jpg','优势成长','Img/img/iimg/4/1.jpg,Img/img/iimg/4/2.jpg,Img/img/iimg/4/3.jpg,Img/img/iimg/4/4.jpg,Img/img/iimg/4/5.jpg','青年成长导师、人生策略顾问帅健翔力作，个体时代跃迁的高效成长方法论，让你认知升级，实现人生蜕变。曾以“优势成长”话题引爆微博，创造了1.1亿阅读量">青年成长导师、人生策略顾问帅健翔力作，个体时代跃迁...',55.0,'0',77
exec Book_Add 'Img/img/iimg/5/2.jpg','青蛙与男孩','Img/img/iimg/5/1.jpg,Img/img/iimg/5/2.jpg,Img/img/iimg/5/3.jpg,Img/img/iimg/5/4.jpg,Img/img/iimg/5/5.jpg','无字书创始人梅瑟·迈尔开山之作/一个男孩与他的伙伴的系列历险故事，充满孩子气的幽默与友情的温暖（蒲公英童书馆出品）',15.0,'0',25
exec Book_Add 'Img/img/iimg/1/1.jpg','人生海海','Img/img/iimg/1/1.jpg,Img/img/iimg/1/2.jpg,Img/img/iimg/1/3.jpg,Img/img/iimg/1/4.jpg,Img/img/iimg/1/5.jpg','60天发行60万册！茅盾文学奖得主麦家力作！豆瓣最受关注图书榜虚构类连续六周TOP1。挑战常人不敢落笔之处，解密人性的荒唐与高尚',60.0,'0',80
exec Book_Add 'Img/img/img/17.jpg','特斯拉自传','Img/img/img/18.jpg,Img/img/img/19.jpg,Img/img/img/20.jpg,Img/img/img/21.jpg,Img/img/img/22.jpg','他，是一位科学先知，也是“电动豪车特斯拉之父”埃隆马斯克的精神偶像，更是迄今为止一位能与达芬奇齐名的天才，但正是这样一位充满传奇色彩的科学巨匠，却几乎被世人遗忘。',30.0,'0',50
exec Book_Add 'Img/img/img/5.jpg','少年读史记','Img/img/img/1.jpg,Img/img/img/2.jpg,Img/img/img/3.jpg,Img/img/img/4.jpg,Img/img/img/5.jpg','现货 统编语文教材推荐指定阅读 荣获第六届中华优秀出版物奖；史学、文学、哲学、国学一次到位，台湾著名儿童作家 张嘉骅倾力打造更适合孩子阅读的《史记》！独家推荐定制版',55.0,'0',75
exec Book_Add 'Img/img/img/10.jpg','董明珠传','Img/img/img/6.jpg,Img/img/img/7.jpg,Img/img/img/8.jpg,Img/img/img/9.jpg,Img/img/img/10.jpg','董明珠作为当代不可忽略的一位女企业家，一直活跃在大众的视线中，卖手机？造汽车？包括最近她的辞职风波，格力涨薪事件等等，这位豪言让世界爱上中国造的女企业家身上有太多的故事。本书介绍了董明珠的个人生活和独自领导格力的经历，完整的呈现了一个女企业家的心路历程',60.0,'0',70
exec Book_Add 'Img/img/img/11.jpg','纳粹元凶希特勒','Img/img/img/16.jpg,Img/img/img/12.jpg,Img/img/img/13.jpg,Img/img/img/14.jpg,Img/img/img/15.jpg','第二次世界大战是人类历史上规模大、战斗为惨烈影响为深远的一场战争。在这场法西斯与反法西斯的较量中，参战双方都涌现出了风云人物。他们或为法西斯卖命，成为了遗臭万年的战争罪犯;或为了人类自由而奋战，成为了名流千古的英雄',32.0,'0',55
exec Book_Add 'Img/img/历代帝王/图片/25341161-5_u_3.jpg','朱元璋传','Img/img/img/23.jpg,Img/img/img/24.jpg,Img/img/img/26.jpg,Img/img/img/26.jpg,Img/img/img/27.jpg','本书详述了明代开国皇帝朱元璋极富传奇色彩的一生，是著名历史学家吴晗先生的代表作品。从朱元璋少年时家破人亡不得不乞讨度日起，到他青年时入郭子兴帐下暗中夺权四处征战，再到他中年一统天下登顶帝位，蕞后老年时殚精竭虑为子孙铺平道路为止',66.0,'0',88
exec Book_Add 'Img/img/img/28.jpg','邓小平时代','Img/img/img/28.jpg,Img/img/img/29.jpg,Img/img/img/30.jpg,Img/img/img/31.jpg,Img/img/img/32.jpg','邓小平深刻影响了中国历史和世界历史的走向，也改变了每一当代中国人的命运。解读邓小平的政治生涯及其行为逻辑，就是解读当代中国，解读个人命运背后的历史变局',99.0,'0',119
exec Book_Add 'Img/img/明星人物/明星人物/33.jpg','科比自传','Img/img/img/33.jpg,Img/img/img/34.jpg,Img/img/img/35.jpg,Img/img/img/36.jpg,Img/img/img/37.jpg','《曼巴精神》是篮球巨星科比·布莱恩特的自传，也是他对自己篮球生涯的惟一一次全面总结。本书以“曼巴精神”为主旨，将带读者进入科比的精神世界，发现这位篮球史上传奇球星的成功秘密。全书分“方法”和“技艺”两大部分',44.0,'0',66
exec Book_Add 'Img/img/img/38.jpg','名人传','Img/img/img/38.jpg,Img/img/img/39.jpg,Img/img/img/40.jpg,Img/img/img/41.jpg,Img/img/img/42.jpg','《名人传》由贝多芬、米开朗琪罗和托尔斯泰三个名人的传记组成，他们都是人类历史上极富天才而建功至伟的的人物，作者紧紧把握住这三位艺术家的共同之处，着力刻画他们在坎坷、困顿的人生征途上历尽苦难而不改初衷的心路历程，凸现他们崇高的人格、博爱的情感和广阔的胸襟，从而谱写了一阙“英雄交响曲”。被称为“三大英雄传记”，也称“巨人三传”。',33.0,'0',55
exec Book_Add 'Img/img/img/38.jpg','名人传','Img/img/img/38.jpg,Img/img/img/39.jpg,Img/img/img/40.jpg,Img/img/img/41.jpg,Img/img/img/42.jpg','《名人传》由贝多芬、米开朗琪罗和托尔斯泰三个名人的传记组成，他们都是人类历史上极富天才而建功至伟的的人物，作者紧紧把握住这三位艺术家的共同之处，着力刻画他们在坎坷、困顿的人生征途上历尽苦难而不改初衷的心路历程，凸现他们崇高的人格、博爱的情感和广阔的胸襟，从而谱写了一阙“英雄交响曲”。被称为“三大英雄传记”，也称“巨人三传”。',33.0,'0',55
exec Book_Add 'Img/img/img/10.jpg','董明珠传','Img/img/img/6.jpg,Img/img/img/7.jpg,Img/img/img/8.jpg,Img/img/img/9.jpg,Img/img/img/10.jpg','董明珠作为当代不可忽略的一位女企业家，一直活跃在大众的视线中，卖手机？造汽车？包括最近她的辞职风波，格力涨薪事件等等，这位豪言让世界爱上中国造的女企业家身上有太多的故事。本书介绍了董明珠的个人生活和独自领导格力的经历，完整的呈现了一个女企业家的心路历程',60.0,'0',70
exec Book_Add 'Img/img33333/财经/2/4.jpg','任正非传','Img/img33333/财经/2/4.jpg,Img/,Img/,Img/,Img/','知名财经作家孙力科历时十年，重磅之作！超权威、超丰富、超真实的任正非传记，亲述任正非跌宕起伏、传奇精彩的一生 艺术绘画 人物传记 每100减40 请点击">知名财经作家孙力科历时十年，重磅之作！超权威、超丰富、超真实的任正非传',45.0,'0',55
exec Book_Add 'Img/img33333/财经/3/1.jpg','马云：未来已来','Img/img33333/财经/3/1.jpg,Img/,Img/,Img/,Img/','阿里授权解读阿里巴巴未来战略作品！全面展现阿里巴巴的商业逻辑和纵深布局！ 快来精神防空洞，经管励志100减50">阿里授权解读阿里巴巴未来战略作品！全面展现阿里',66.0,'0',77
exec Book_Add 'Img/img33333/财经/4/1.jpg','褚时健传','Img/img33333/财经/4/1.jpg,Img/,Img/,Img/,Img/','褚时健亲笔授权新版传记。再现他从“烟王”到“橙王”的励志企业家形象，把每一天安排好，就是对人生负责任。 艺术绘画 人物传记 每100减40 请点击">褚时健亲笔授权新版传记。再现他从“烟王”到“橙王”的励',24.0,'0',33
exec Book_Add 'Img/img33333/财经/5/1.jpg','雷军传：站在风口上','Img/img33333/财经/5/1.jpg,Img/,Img/,Img/,Img/','厚道的IT劳模雷军带领上市后的小米能飞多远？直接或间接投资了500多家创业公司，笑看不能回头的创投之路、解读技术理工男的心灵成长史。版权已售日本、韩国、埃及。 艺术绘画 人物传记 每100减40 请点击">厚道的IT劳模雷军带领上市后的小米能飞多远？',33.0,'0',44
exec Book_Add 'Img/img/img/11.jpg','纳粹元凶希特勒','Img/img/img/16.jpg,Img/img/img/12.jpg,Img/img/img/13.jpg,Img/img/img/14.jpg,Img/img/img/15.jpg','第二次世界大战是人类历史上规模大、战斗为惨烈影响为深远的一场战争。在这场法西斯与反法西斯的较量中，参战双方都涌现出了风云人物。他们或为法西斯卖命，成为了遗臭万年的战争罪犯;或为了人类自由而奋战，成为了名流千古的英雄',32.0,'0',55
exec Book_Add 'Img/img/img/28.jpg','邓小平时代','Img/img/img/28.jpg,Img/img/img/29.jpg,Img/img/img/30.jpg,Img/img/img/31.jpg,Img/img/img/32.jpg','邓小平深刻影响了中国历史和世界历史的走向，也改变了每一当代中国人的命运。解读邓小平的政治生涯及其行为逻辑，就是解读当代中国，解读个人命运背后的历史变局',99.0,'0',119
exec Book_Add 'Img/img33333/军事/2/1.jpg','子弹上膛','Img/img33333/军事/2/1.jpg,Img/,Img/,Img/,Img/','全套13册 刘猛军事小说作品全集最后一颗子弹 特警力量/狼牙/狙击生死线/霹雳火/子弹上膛/危机四伏/利刃出鞘等 ',10.0,'0',20
exec Book_Add 'Img/img33333/军事/3/1.jpg','战争论','Img/img33333/军事/3/1.jpg,Img/,Img/,Img/,Img/','战争论+君主论+国富论+社会契约论+理想国+沉思录+道德情操论（全七册）克劳塞维茨等著 西方哲学史军事小说书籍西方近代军事理论的奠基之作',15.0,'0',20
exec Book_Add 'Img/img33333/军事/4/1.jpg','利刃出鞘','Img/img33333/军事/4/1.jpg,Img/,Img/,Img/,Img/','刘猛军事小说一部展现国安特工神秘铁血人生军事小说畅销小说书籍刘猛军事小说正版全套之一">刘猛军事小说一部展现国安特工神秘铁血人生军事小说畅销小说',22.0,'0',30
exec Book_Add 'Img/img33333/军事/5/1.jpg','海军，海军！','Img/img33333/军事/5/1.jpg,Img/,Img/,Img/,Img/','大量史料披露 历史更胜虚构 清史研究戴逸先生力荐 百余年国家海洋战略反思">大量史料披露 历史更胜虚构 清史研究戴逸先生力荐 百余年',66.0,'0',88
exec Book_Add 'Img/img/img/5.jpg','少年读史记','Img/img/img/1.jpg,Img/img/img/2.jpg,Img/img/img/3.jpg,Img/img/img/4.jpg,Img/img/img/5.jpg','现货 统编语文教材推荐指定阅读 荣获第六届中华优秀出版物奖；史学、文学、哲学、国学一次到位，台湾著名儿童作家 张嘉骅倾力打造更适合孩子阅读的《史记》！独家推荐定制版',55.0,'0',75
exec Book_Add 'Img/img/历代帝王/图片/25341161-5_u_3.jpg','朱元璋传','Img/img/img/23.jpg,Img/img/img/24.jpg,Img/img/img/26.jpg,Img/img/img/26.jpg,Img/img/img/27.jpg','本书详述了明代开国皇帝朱元璋极富传奇色彩的一生，是著名历史学家吴晗先生的代表作品。从朱元璋少年时家破人亡不得不乞讨度日起，到他青年时入郭子兴帐下暗中夺权四处征战，再到他中年一统天下登顶帝位，蕞后老年时殚精竭虑为子孙铺平道路为止',66.0,'0',88
exec Book_Add 'Img/img33333/历史/2/1.jpg','非常道','Img/img33333/历史/2/1.jpg,Img/,Img/,Img/,Img/','当当独家签名版！碎片化读史开山之作，以好玩、热血的话语碎片，抵达意想不到的历史深处！',15.0,'0',30
exec Book_Add 'Img/img33333/历史/3/1.jpg','文明的力量','Img/img33333/历史/3/1.jpg,Img/,Img/,Img/,Img/','中华文明道统不绝，历几千年而不衰，以其强大的生命力屹立于世界，凭借的是何种力量？本书以时间为线，以文化交流为轴；是一部影响世界的中华文明的微型百科全书">中华文明道统不绝，历几千年而不衰，以其强大的生命力屹立于',55.0,'0',75
exec Book_Add 'Img/img33333/历史/4/2.jpg','我和我的祖国','Img/img33333/历史/4/2.jpg,Img/,Img/,Img/,Img/','70周年，7位导演，7段故事，汇集感动中国的瞬间 中国电影梦之队献礼70周年 爱国主义教育推荐读本 我的精神防空洞',15.0,'0',30
exec Book_Add 'Img/img33333/历史/5/1.jpg','全球通史','Img/img33333/历史/5/1.jpg,Img/,Img/,Img/,Img/','中国畅销200万册，修订版新增数百幅珍贵的图片和脉络清晰的地图。你将看到一个从来就存在，却被大多数人无视的真实世界',66.0,'0',88
exec Book_Add 'Img/img/img/5.jpg','少年读史记','Img/img/img/1.jpg,Img/img/img/2.jpg,Img/img/img/3.jpg,Img/img/img/4.jpg,Img/img/img/5.jpg','现货 统编语文教材推荐指定阅读 荣获第六届中华优秀出版物奖；史学、文学、哲学、国学一次到位，台湾著名儿童作家 张嘉骅倾力打造更适合孩子阅读的《史记》！独家推荐定制版',55.0,'0',75
exec Book_Add 'Img/img33333/童书/1/2.jpg','小狗钱钱','Img/img33333/童书/1/2.jpg,Img/,Img/,Img/,Img/','一个童话般的理财故事，一幅没有画框的风景。《小狗钱钱》一经出版，受到了广大读者的喜爱。理财智慧将伴随美好的故事情节深入孩子的脑海。成长不是一段独立的时光，而是不断深化的过程。',20.0,'0',30
exec Book_Add 'Img/img33333/童书/2/1.jpg','为你自己读书','Img/img33333/童书/2/1.jpg,Img/,Img/,Img/,Img/','持续畅销10年，读者热评超过150000的零营销口碑好书 一声书声一声秋 万种童书每满100减40">持续畅销10年，读者热评超过150000的零营销口碑好书',10.0,'0',15
exec Book_Add 'Img/img33333/童书/3/1.jpg','写给孩子的哲学启蒙书','Img/img33333/童书/3/1.jpg,Img/,Img/,Img/,Img/','购买《写给孩子的哲学启蒙书》（7-8卷），请点击页面下方【编辑推荐】内的购买链接">购买《写给孩子的哲学启蒙书》（7-8卷）',66.0,'0',88
exec Book_Add 'Img/img33333/童书/4/3.jpg','致未来的你','Img/img33333/童书/4/3.jpg,Img/,Img/,Img/,Img/','男儿当自强，重塑新时代男孩精神，重新找回阳刚气质的心灵励志书。">男儿当自强，重塑新时代男孩精神，重新找回阳刚气质的心灵励志书',22.0,'0',33
exec Book_Add 'Img/img33333/童书/5/4.jpg','挫折万岁','Img/img33333/童书/5/4.jpg,Img/,Img/,Img/,Img/','积极引导胜过苦口说教！来自日本童心社，针对小学中低年级孩子，是另类的逆商教育故事书，也是治愈系儿童小说">【积极引导胜过苦口说教！来自日本童心社，针对小学中',50.0,'0',60
exec Book_Add 'Img/img/iimg/4/1.jpg','优势成长','Img/img/iimg/4/1.jpg,Img/img/iimg/4/2.jpg,Img/img/iimg/4/3.jpg,Img/img/iimg/4/4.jpg,Img/img/iimg/4/5.jpg','青年成长导师、人生策略顾问帅健翔力作，个体时代跃迁的高效成长方法论，让你认知升级，实现人生蜕变。曾以“优势成长”话题引爆微博，创造了1.1亿阅读量">青年成长导师、人生策略顾问帅健翔力作，个体时代跃迁...',55.0,'0',77
exec Book_Add 'Img/img33333/管理/1/3.jpg','深度思考','Img/img33333/管理/1/3.jpg,Img/,Img/,Img/,Img/','香奈儿前全球CEO首部职场进阶力作！《创新者的窘境》作者克莱顿·克里斯坦森力荐畅销书！">香奈儿前全球CEO首部职场进阶力作！',15.0,'0',19
exec Book_Add 'Img/img33333/管理/2/2.jpg','管理的实践','Img/img33333/管理/2/2.jpg,Img/,Img/,Img/,Img/','纪念德鲁克诞辰110周年活动进行中（详见产品特色） 快来精神防空洞，经管励志100减50">纪念德鲁克诞辰110周年活动进行中',30.0,'0',40
exec Book_Add 'Img/img33333/管理/3/1.jpg','共情营销','Img/img33333/管理/3/1.jpg,Img/,Img/,Img/,Img/','好营销就是使推销成为多余！美国著名战略咨询公司ModelPeople总裁、杜伦大学MBA营销课程设计者克莱尔·布鲁克斯近20年实践深度总结，手把手教你快速实现低成本爆发式销售增长！">好营销就是使推销成为多余！',10.0,'0',15
exec Book_Add 'Img/img33333/管理/4/1.jpg','低风险创业','Img/img33333/管理/4/1.jpg,Img/,Img/,Img/,Img/','创业书籍，创业维艰，重新理解创业，深度揭秘裂变式创业，讲述樊登亲身践行的创业6大心法，樊登读书5年实现1500万+用户的指数级增长的奥秘',40.0,'0',50
exec Book_Add 'Img/img33333/管理/5/1.jpg','熵减','Img/img33333/管理/5/1.jpg,Img/,Img/,Img/,Img/','继“华为管理三部曲”之后，华为公司又一部内训教材对外公开,官方授权发布，任正非作序。周其仁、吴晓波、杨国安鼎力推荐！一本书读懂任正非华为管理哲学的核心框架，追溯华为组织活力之源',33.0,'0',44
exec Book_Add 'Img/img/iimg/5/2.jpg','青蛙与男孩','Img/img/iimg/5/1.jpg,Img/img/iimg/5/2.jpg,Img/img/iimg/5/3.jpg,Img/img/iimg/5/4.jpg,Img/img/iimg/5/5.jpg','无字书创始人梅瑟·迈尔开山之作/一个男孩与他的伙伴的系列历险故事，充满孩子气的幽默与友情的温暖（蒲公英童书馆出品）',15.0,'0',25
exec Book_Add 'Img/img33333/艺术/1/1.jpg','艺术博物馆','Img/img33333/艺术/1/1.jpg,Img/,Img/,Img/,Img/','全球100余位专家鼎力合作，历时13年打造的纸上博物馆，不可错过家庭艺术藏书。附赠精心制作的大幅世界艺术年表。',44.0,'0',66
exec Book_Add 'Img/img33333/艺术/2/1.jpg','文艺复兴三杰','Img/img33333/艺术/2/1.jpg,Img/,Img/,Img/,Img/','文艺复兴三杰：达·芬奇、拉斐尔、米开朗琪罗（套装共3册）文艺复兴三杰艺术巨作，全球上百家博物馆和收藏家授权，历时10年打造的纸上博物馆，不可错过家庭艺术藏书。">文艺复兴三杰：达·芬奇、拉斐尔、米开朗琪罗',55.0,'0',66
exec Book_Add 'Img/img33333/艺术/3/1.jpg','玄奘取经图像','Img/img33333/艺术/3/1.jpg,Img/,Img/,Img/,Img/','西游记壁画与玄奘取经图像324面全彩内文,446幅高清壁画图,系统还原西游壁画取经图像,直观展示各个时期取经故事',36.0,'0',55
exec Book_Add 'Img/img33333/艺术/4/2.jpg','书法没有秘密','Img/img33333/艺术/4/2.jpg,Img/,Img/,Img/,Img/','《书法没有秘密》再出典藏本。马伯庸2018年阅读书单推荐：从内容到装帧2018年*匠心的一本！跟随书法家寇克让先生，领略黑白世界中的缤纷与神妙',21.0,'0',30
exec Book_Add 'Img/img33333/艺术/5/1.jpg','因为我有生活','Img/img33333/艺术/5/1.jpg,Img/,Img/,Img/,Img/','豆瓣评分8.7,《人民日报》、澎湃新闻大版面专访 引爆10万+阅读量公号文 《甄嬛传》《三生三世十里桃花》美术指导诚荐恩师之作，收录手绘插图、设计手稿近百幅，赠创意书签">豆瓣评分8.7,《人民日报》、澎湃新闻大版面专访 引爆10万+阅读量公号文',55.0,'0',66
exec Book_Add 'Img/img/iimg/2/1.jpg','傲骨','Img/img/iimg/2/1.jpg,Img/img/iimg/2/2.jpg,Img/img/iimg/2/3.jpg,Img/img/iimg/2/4.jpg,Img/img/iimg/2/2.jpg','(知名作家白饭如霜青春职场力作，唐家三少、沧月、陆琪等畅销书作家鼎力推荐！在现实法则中肆意蓬勃，在尔虞我诈中心如赤子，所有的极限施压，伴随的往往都是成长！）',55.0,'0',70
exec Book_Add 'Img/img33333/青春文学/1/1.jpg','你是迟来的欢喜','Img/img33333/青春文学/1/1.jpg,Img/,Img/,Img/,Img/','（新锐暖萌系作家顾了之爆笑甜宠之作，唤醒所有人的暗恋心事。在这五光十色的世界里，你是年少的欢喜，也是余生的四季。新增甜蜜番外！白马时光） 我的精神防空洞， ">新锐暖萌系作家顾了之爆笑甜宠之作，唤醒所有人的暗恋心事',55.0,'0',99
exec Book_Add 'Img/img33333/青春文学/2/1.jpg','青春的梦，在青春做完','Img/img33333/青春文学/2/1.jpg,Img/,Img/,Img/,Img/','随书附赠梦想打卡手册！精美双封面海报！妈妈倾情作序，卢思浩、李尚龙、王义博心动推荐，带你回到那些年千军万马奔赴的高考，回到曾经以为毕业遥遥无期转眼就各奔东西的校园。 ">随书附赠梦想打卡手册！精美双封面海报！',88.0,'0',100
exec Book_Add 'Img/img33333/青春文学/3/1.jpg','夏目友人帐','Img/img33333/青春文学/3/1.jpg,Img/,Img/,Img/,Img/','只要有想见的人，就不再会是孤身一人了。日本殿堂级漫画家绿川幸感动千万网友的超治愈系神作。中国首次日方正版授权，初次小说化。 ">只要有想见的人，就不再会是孤身一人了。日本殿堂级漫画家绿川幸感',120.0,'0',150
exec Book_Add 'Img/img33333/青春文学/4/1.jpg','恰似寒光遇骄阳','Img/img33333/青春文学/4/1.jpg,Img/,Img/,Img/,Img/','囧囧有妖全新作品，云起书院原创文学风云榜高位！寒光与骄阳的相遇，究竟会擦出怎样的火花？ ">囧囧有妖全新作品，云起书院原创文学风云榜高位！寒光与骄阳的相遇',68.0,'0',88
exec Book_Add 'Img/img33333/青春文学/5/1.jpg','提灯映桃花','Img/img33333/青春文学/5/1.jpg,Img/,Img/,Img/,Img/','《破云》同一作者作品。高人气畅销书作家”淮上“燃情巨献！晋江原创网【现象级】纯爱力作，蝉联季榜年榜销售金榜TOP1，天价影视已筹拍！随书附赠8张水彩塔罗牌+书签！ ">《破云》同一作者作品',33.0,'0',63
exec Book_Add 'Img/img/iimg/1/1.jpg','人生海海','Img/img/iimg/1/1.jpg,Img/img/iimg/1/2.jpg,Img/img/iimg/1/3.jpg,Img/img/iimg/1/4.jpg,Img/img/iimg/1/5.jpg','60天发行60万册！茅盾文学奖得主麦家力作！豆瓣最受关注图书榜虚构类连续六周TOP1。挑战常人不敢落笔之处，解密人性的荒唐与高尚',60.0,'0',80
exec Book_Add 'Img/img33333/小说/1/2.jpg','江南','Img/img33333/小说/1/2.jpg,Img/,Img/,Img/,Img/','我接受生活的糟糕，但拒绝命运的安排。茅盾文学奖超高票获奖，格非代表作，莫言推崇“值得我们骄傲”！见真情，见生死，映照中国人一个世纪的命运',12.0,'0',24
exec Book_Add 'Img/img33333/小说/2/1.jpg','三体','Img/img33333/小说/2/1.jpg	,Img/,Img/,Img/,Img/','全三册 刘慈欣代表作，亚洲首部“雨果奖”获奖作品！预售商品 ">全三册 刘慈欣代表作，亚洲首部“雨果奖”获奖作品',33.0,'0',66
exec Book_Add 'Img/img33333/小说/3/1.jpg','活着','Img/img33333/小说/3/1.jpg,Img/,Img/,Img/,Img/','余华是我国当代著名作家，也是享誉世界的小说家，曾荣获众多国内外奖项。《活着》是其代表作，在全球广泛传播，销量逾千万册，获得了普遍好评，已成为中国乃至世界当代文学的经典。 ">余华是我国当代著名作家，也是享誉世界的小说家，',85.0,'0',105
exec Book_Add 'Img/img33333/小说/4/1.jpg','失乐园','Img/img33333/小说/4/1.jpg,Img/,Img/,Img/,Img/','渡边淳一代表作，长期雄踞日本畅销书排行榜榜首，由黑木瞳、役所广司主演的电影引发“失乐园”热。此次的全新林少华译本，将带你体味不一样的渡边淳一，不一样的失乐园',65.0,'0',85
exec Book_Add 'Img/img33333/小说/5/1.jpg','边城','Img/img33333/小说/5/1.jpg,Img/,Img/,Img/,Img/','沈从文和湘西“封圣”之作，20世纪中文小说百强第二名，被翻译成40多种语言的*杰作。重现湘西世界的诗意与纯净，书写人情美、人事美、人性美的极致',89.0,'0',109
exec Book_Add 'Img/img/img/17.jpg','特斯拉自传','Img/img/img/18.jpg,Img/img/img/19.jpg,Img/img/img/20.jpg,Img/img/img/21.jpg,Img/img/img/22.jpg','他，是一位科学先知，也是“电动豪车特斯拉之父”埃隆马斯克的精神偶像，更是迄今为止一位能与达芬奇齐名的天才，但正是这样一位充满传奇色彩的科学巨匠，却几乎被世人遗忘。',30.0,'0',50
exec Book_Add 'Img/img33333/科技/2/1.jpg','发现之旅','Img/img33333/科技/2/1.jpg,Img/,Img/,Img/,Img/','英国伦敦自然博物馆馆长推荐，三本书讲述浓缩的博物简史，三本书展现人类发现自然世界的探险地图',59.0,'0',79
exec Book_Add 'Img/img33333/科技/3/1.jpg','宇宙','Img/img33333/科技/3/1.jpg,Img/,Img/,Img/,Img/','连续70周《纽约时报》排行榜冠军！畅销80国，全球销售量500万册。《时代周刊》《科学美国人》美国国会图书馆盛赞！中国科学院、北京天文馆专家诚意推荐',88.0,'0',108
exec Book_Add 'Img/img33333/科技/4/1.jpg','七堂极简物理课','Img/img33333/科技/4/1.jpg,Img/,Img/,Img/,Img/','《时间简史》后现象级畅销科普读物。李淼诚意推荐！黄磊倾情献声喜马拉雅有声版。意大利疯卖的优美科普，荣获出版人“2016年度好书”奖，入围文津图书奖科普类',65.0,'0',95
exec Book_Add 'Img/img33333/科技/5/1.jpg','时间的形状','Img/img33333/科技/5/1.jpg,Img/,Img/,Img/,Img/','第八届文津奖获奖图书” （ 这不是一本书，这是一个全新的宇宙观） ">“第八届文津奖获奖图书”',45.0,'0',75
exec Book_Add 'Img/img/iimg/4/1.jpg','优势成长','Img/img/iimg/4/1.jpg,Img/img/iimg/4/2.jpg,Img/img/iimg/4/3.jpg,Img/img/iimg/4/4.jpg,Img/img/iimg/4/5.jpg','青年成长导师、人生策略顾问帅健翔力作，个体时代跃迁的高效成长方法论，让你认知升级，实现人生蜕变。曾以“优势成长”话题引爆微博，创造了1.1亿阅读量">青年成长导师、人生策略顾问帅健翔力作，个体时代跃迁...',55.0,'0',77


