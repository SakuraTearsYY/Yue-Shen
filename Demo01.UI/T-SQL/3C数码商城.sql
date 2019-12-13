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

--һ���˵�
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
--�����˵�
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
insert into FirstType values('��Ʒ����',0)
 insert into FirstType values('��Ʒ����',0)
 insert into FirstType values('�������',0)
 insert into FirstType values('�ҵ���Ʒ',1)
 insert into FirstType values('�ҵ�����',1)
 go
 insert into SecondType values('�ֻ�',1)
insert into SecondType values('ƽ��',1)
insert into SecondType values('�ʼǱ�',1)
insert into SecondType values('̨ʽ��',1)
insert into SecondType values('�鿴��Ʒ',4)
insert into SecondType values('������Ʒ',4)
go
insert into ProductCategory values('�ֻ�')
insert into ProductCategory values('ƽ��')
insert into ProductCategory values('�ʼǱ�')
insert into ProductCategory values('̨ʽ��')
go
insert  into Product values('iphone XR',6800,7800,1,1,'aaaa',1,default,default)
insert  into Product values('��ҫ V20',2900,3500,1,1,'bbbb',0,default,default)
insert  into Product values('С��9',2900,4000,1,1,'bbbb',0,default,default)
insert  into Product values('��Ϊ P30',5800,6000,1,1,'bbbb',0,default,default)
insert  into Product values('OPPO R15',2900,3500,1,1,'bbbb',0,default,default)
insert  into Product values('1PlusPro',4800,4900,1,1,'bbbb',0,default,default)
insert  into Product values('���� 16s',2900,3500,1,1,'bbbb',0,default,default)
insert  into Product values('С��9 Pro',3700,3800,1,1,'bbbb',0,default,default)
insert  into Product values('��Ϊ meta30',2900,3500,1,1,'bbbb',0,default,default)
insert  into Product values('VIVO R15',2900,3500,1,1,'bbbb',0,default,default)
insert  into Product values('������ V7000P',8099,8800,3,3,'cccc',1,default,default)
insert  into Product values('��˶Y5000UB',3900,4100,3,3,'cccc',1,default,default)
insert  into Product values('����',6000,6100,3,3,'cccc',1,default,default)
insert  into Product values('�󱾱�5S',5300,5900,3,3,'cccc',1,default,default)
insert  into Product values('������ V720R',5600,5800,3,3,'cccc',1,default,default)
insert  into Product values('������',12000,12999,3,3,'cccc',1,default,default)
insert  into Product values('����С��Pro13',6099,6800,3,3,'cccc',1,default,default)
insert  into Product values('��Ϊƽ�� MS �ഺ��',2099,3100,2,2,'dddd',1,default,default)
insert  into Product values('ƻ�� iPad 7',2699,3100,2,2,'dddd',1,default,default)
insert  into Product values('��ΪM6���ܰ�',2499,2600,2,2,'dddd',1,default,default)
insert  into Product values('΢�� Surface Pro 7',19056,20000,2,2,'dddd',1,default,default)
insert  into Product values('ƻ�� iPad Pro',8113,8000,2,2,'dddd',1,default,default)
insert  into Product values('С��ƽ��4 Plus',1699,1500,2,2,'dddd',1,default,default)
insert  into Product values('����Galaxy Tab',1399,1250,2,2,'dddd',1,default,default)
insert  into Product values('��Ϊ��ҫƽ��5',1199,1000,2,2,'dddd',1,default,default)
insert  into Product values('���� 510 Pro',5200,4866,4,4,'eeee',0,default,default)
insert  into Product values('������',15000,16000,4,4,'eeee',0,default,default)
insert  into Product values('��˶S340MF',5200,4866,4,4,'eeee',0,default,default)
insert  into Product values('����',5200,4866,4,4,'eeee',0,default,default)
insert  into Product values('�����羺',5200,4866,4,4,'eeee',0,default,default)
insert  into Product values('����',5200,4866,4,4,'eeee',0,default,default)
insert  into Product values('ƻ��Mac Pro',1088888,156666,4,4,'eeee',0,default,default)
insert  into Product values('DIY�ݻ�ˮ��',269999,388888,4,4,'eeee',0,default,default)
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
