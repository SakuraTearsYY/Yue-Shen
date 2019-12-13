use master
go

if exists (select * from sys.databases where name='DigitalProductShop')
drop database DigitalProductShop
go

create database DigitalProductShop
go

use DigitalProductShop
go

if exists(select * from sys.tables where name='UserInfo')
drop table UserInfo
go
create table UserInfo
(
UserID int primary key identity(1,1),
UserName nvarchar(16) not null,
UserPwd varchar(32) not null,
UserCord int check(UserCord=0 or UserCord=1) not null
)

--一级菜单
if exists(select * from sys.tables where name='FirstType')
drop table FirstType
go
create table FirstType
(
FirstID int primary key identity(1,1),
FirstName nvarchar(16) not null,
UserID int references UserInfo(UserID)
)
go
--二级菜单
if exists(select * from sys.tables where name='SecondType')
drop table SecondType
go
create table SecondType
(
SecondID int primary key identity(1,1),
SecondName nvarchar(16) not null,
FirstID int references FirstType(FirstID) not null
)
go

if exists(select * from sys.tables where name='ProductCategory')
drop table ProductCategory
go
create table ProductCategory
(
Id int primary key identity(1,1),
Name nvarchar(16)
)


if exists(select * from sys.tables where name='Product')
drop table Product
go

create table Product
(
Id int primary key identity(1,1),
ProductName nvarchar(32) not null,
MarketPrice decimal(16,2) not null,
SellingPrice decimal(16,2) not null,
CategoryId int references ProductCategory(Id),
SecondID int references SecondType(SecondID),
Introduction nvarchar(128) not null,
IsOnSale bit not null,
AddTime datetime default(getdate()),
EndTime datetime default('')
)
go

insert into UserInfo values('admin','admin',0)
insert into UserInfo values('123456','123456',1)
go
insert into FirstType values('商品类型',0)
 insert into FirstType values('商品管理',0)
 insert into FirstType values('特殊情况',0)
 insert into FirstType values('我的商品',1)
 insert into FirstType values('我的收益',1)
 go
 insert into SecondType values('手机',1)
insert into SecondType values('平板',1)
insert into SecondType values('笔记本',1)
insert into SecondType values('台式机',1)
insert into SecondType values('查看商品',4)
insert into SecondType values('新增商品',4)
go
insert into ProductCategory values('手机')
insert into ProductCategory values('平板')
insert into ProductCategory values('笔记本')
insert into ProductCategory values('台式机')
go
insert  into Product values('iphone XR',6800,7800,1,1,'aaaa',1,default,default)
insert  into Product values('荣耀 V20',2900,3500,1,1,'bbbb',0,default,default)
insert  into Product values('小米9',2900,4000,1,1,'bbbb',0,default,default)
insert  into Product values('华为 P30',5800,6000,1,1,'bbbb',0,default,default)
insert  into Product values('OPPO R15',2900,3500,1,1,'bbbb',0,default,default)
insert  into Product values('1PlusPro',4800,4900,1,1,'bbbb',0,default,default)
insert  into Product values('魅族 16s',2900,3500,1,1,'bbbb',0,default,default)
insert  into Product values('小米9 Pro',3700,3800,1,1,'bbbb',0,default,default)
insert  into Product values('华为 meta30',2900,3500,1,1,'bbbb',0,default,default)
insert  into Product values('VIVO R15',2900,3500,1,1,'bbbb',0,default,default)
insert  into Product values('拯救者 V7000P',8099,8800,3,3,'cccc',1,default,default)
insert  into Product values('华硕Y5000UB',3900,4100,3,3,'cccc',1,default,default)
insert  into Product values('神州',6000,6100,3,3,'cccc',1,default,default)
insert  into Product values('麦本本5S',5300,5900,3,3,'cccc',1,default,default)
insert  into Product values('拯救者 V720R',5600,5800,3,3,'cccc',1,default,default)
insert  into Product values('外星人',12000,12999,3,3,'cccc',1,default,default)
insert  into Product values('联想小新Pro13',6099,6800,3,3,'cccc',1,default,default)
insert  into Product values('华为平板 MS 青春版',2099,3100,2,2,'dddd',1,default,default)
insert  into Product values('苹果 iPad 7',2699,3100,2,2,'dddd',1,default,default)
insert  into Product values('华为M6高能板',2499,2600,2,2,'dddd',1,default,default)
insert  into Product values('微软 Surface Pro 7',19056,20000,2,2,'dddd',1,default,default)
insert  into Product values('苹果 iPad Pro',8113,8000,2,2,'dddd',1,default,default)
insert  into Product values('小米平板4 Plus',1699,1500,2,2,'dddd',1,default,default)
insert  into Product values('三星Galaxy Tab',1399,1250,2,2,'dddd',1,default,default)
insert  into Product values('华为荣耀平板5',1199,1000,2,2,'dddd',1,default,default)
insert  into Product values('天逸 510 Pro',5200,4866,4,4,'eeee',0,default,default)
insert  into Product values('外星人',15000,16000,4,4,'eeee',0,default,default)
insert  into Product values('华硕S340MF',5200,4866,4,4,'eeee',0,default,default)
insert  into Product values('联想',5200,4866,4,4,'eeee',0,default,default)
insert  into Product values('戴尔电竞',5200,4866,4,4,'eeee',0,default,default)
insert  into Product values('惠普',5200,4866,4,4,'eeee',0,default,default)
insert  into Product values('苹果Mac Pro',1088888,156666,4,4,'eeee',0,default,default)
insert  into Product values('DIY奢华水冷',269999,388888,4,4,'eeee',0,default,default)
go


select * from FirstType
select UserCord from UserInfo u,FirstType f where u.UserID=f.UserID and username=   userpwd=  

select *  from FirstType f,SecondType s where  f.FirstID=s.FirstID

select * from SecondType s,Product p where s.SecondID=p.SecondID and s.SecondID=1
 
select * from UserInfo u,FirstType f,SecondType s where u.UserID=f.UserID and f.FirstID=s.FirstID
/*
select * from ProductCategory,Product 
where ProductCategory.Id=Product.CategoryId 
and ProductName like '%'+'i'+'%'
and CategoryId=1
*/
-------------------------
if exists(select * from sys.procedures where name='ProductCategory_select')
drop proc ProductCategory_select
go
create proc ProductCategory_select 
as
select * from ProductCategory
go

if exists(select * from sys.procedures where name='Product_select')
drop proc Product_select
go
create proc Product_select @ProductName nvarchar(32)='',@CategoryId int=0
as
	declare @sid nvarchar(max)
	set @sid='select * from ProductCategory,Product where ProductCategory.Id=Product.CategoryId and ProductName like ''%'+@ProductName+'%'''
	if	@CategoryId<>0
	set @sid+=' and CategoryId='+CONVERT(nvarchar,@CategoryId)
	exec(@sid)
go

if exists(select * from sys.procedures where name='Product_update')
drop proc Product_update
go
create proc Product_update @Id int,@ProductName nvarchar(32),@MarketPrice decimal(16,2),@SellingPrice decimal(16,2),
@CategoryId int,@Introduction nvarchar(128),@IsOnSale bit
as
	update Product set  ProductName=@ProductName,MarketPrice=@MarketPrice,SellingPrice=@SellingPrice,
	CategoryId=@CategoryId,Introduction=@Introduction,IsOnSale=@IsOnSale
	where Id=@Id
go
