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
UserPwd varchar(32) not null
)

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
Introduction nvarchar(128) not null,
IsOnSale bit not null,
AddTime datetime default(getdate())
)
go

insert into UserInfo values('admin','admin')
go
insert into ProductCategory values('手机')
insert into ProductCategory values('笔记本')
insert into ProductCategory values('平板电脑')
insert into ProductCategory values('台式机')
go
insert  into Product values('iphone XR',6800,7800,1,'aaaa',1,default)
insert  into Product values('荣耀 V20',2900,3500,1,'bbbb',0,default)
insert  into Product values('拯救者 V7000P',8099,8800,2,'cccc',1,default)
insert  into Product values('华为平板 MS 青春版',2099,3100,3,'dddd',1,default)
insert  into Product values('天逸 510 Pro',5200,4866,4,'eeee',0,default)
go
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
