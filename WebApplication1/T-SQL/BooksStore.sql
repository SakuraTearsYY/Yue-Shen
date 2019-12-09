
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
--ͼ����Ϣ

create  table  Book 
(
	BookID int primary key identity(1,1),--ͼ����
	BookIndexImg varchar(max)not null,--��ҳͼƬ·��
	BookName varchar(50) not null,--ͼ������
	BookDetailsImg varchar(max) not null,--����ͼƬ·��
	BookDetails varchar(max) not null,--ͼ����
	BookPrice float  not null,--�ۼ�
	BookRoost varchar(2) not null,--�ϼ�״̬ bit check(0='��' or 1='��')default(0)
	BookStock int not null,--���
)

if exists(select * from sys.procedures where name ='Book_Sel')--ͼ����ϸ��Ϣ��ѯ
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

if exists(select * from sys.procedures where name ='Book_Add')--ͼ����ϸ��Ϣ��ѯ
drop proc Book_Add
go
create proc Book_Add @BookIndexImg varchar(max),@BookName varchar(50),@BookDetailsImg varchar(max),@BookDetails varchar(max),@BookPrice float,@BookRoost varchar(2),@BookStock int
as
	insert into Book values(@BookIndexImg,@BookName,@BookDetailsImg,@BookDetails,@BookPrice,@BookRoost,@BookStock)
go
exec Book_Add 'Img/img/iimg/3/2.jpg','˵����','Img/img/iimg/3/1.jpg,Img/img/iimg/3/2.jpg,Img/img/iimg/3/3.jpg,Img/img/iimg/3/4.jpg,Img/img/iimg/3/5.jpg','������̨���������⽯��ʯ�������٣������汾��Ϊ�ѵá��˴γ������ݹ��񵳡����빤���ռǡ��Ļ��ܵ�����Ѱ��İ汾������������֮�������˶������������',34.0,'0',500
exec Book_Add 'Img/img/img/43.jpg','��һ��������������','Img/img/img/44.jpg,Img/img/img/45.jpg,Img/img/img/46.jpg,Img/img/img/47.jpg,Img/img/img/43.jpg','����δ룬����*������ɫ�ʵĴ���������İ��飬��Խ���ֵĳ������̻������������ĵ�ʱ�䣬��������ѩ�����һ��ʱ�ⱻ��ʰ��������һ��ʯ���ĸ�ɣ�����ٲ����ļ����ģ��������㡣',50.0,'0',60
exec Book_Add 'Img/img/iimg/2/1.jpg','����','Img/img/iimg/2/1.jpg,Img/img/iimg/2/2.jpg,Img/img/iimg/2/3.jpg,Img/img/iimg/2/4.jpg,Img/img/iimg/2/2.jpg','(֪�����Ұ׷���˪�ഺְ���������Ƽ����١����¡�½���ȳ��������Ҷ����Ƽ�������ʵ��������������ڶ�����թ��������ӣ����еļ���ʩѹ��������������ǳɳ�����',55.0,'0',70
exec Book_Add 'Img/img/iimg/4/1.jpg','���Ƴɳ�','Img/img/iimg/4/1.jpg,Img/img/iimg/4/2.jpg,Img/img/iimg/4/3.jpg,Img/img/iimg/4/4.jpg,Img/img/iimg/4/5.jpg','����ɳ���ʦ���������Թ���˧��������������ʱ��ԾǨ�ĸ�Ч�ɳ������ۣ�������֪������ʵ�������ɱ䡣���ԡ����Ƴɳ�����������΢����������1.1���Ķ���">����ɳ���ʦ���������Թ���˧��������������ʱ��ԾǨ...',55.0,'0',77
exec Book_Add 'Img/img/iimg/5/2.jpg','�������к�','Img/img/iimg/5/1.jpg,Img/img/iimg/5/2.jpg,Img/img/iimg/5/3.jpg,Img/img/iimg/5/4.jpg,Img/img/iimg/5/5.jpg','�����鴴ʼ��÷ɪ��������ɽ֮��/һ���к������Ļ���ϵ�����չ��£���������������Ĭ���������ů���ѹ�Ӣͯ��ݳ�Ʒ��',15.0,'0',25
exec Book_Add 'Img/img/iimg/1/1.jpg','��������','Img/img/iimg/1/1.jpg,Img/img/iimg/1/2.jpg,Img/img/iimg/1/3.jpg,Img/img/iimg/1/4.jpg,Img/img/iimg/1/5.jpg','60�췢��60��ᣡé����ѧ����������������������ܹ�עͼ����鹹����������TOP1����ս���˲������֮�����������ԵĻ��������',60.0,'0',80
exec Book_Add 'Img/img/img/17.jpg','��˹���Դ�','Img/img/img/18.jpg,Img/img/img/19.jpg,Img/img/img/20.jpg,Img/img/img/21.jpg,Img/img/img/22.jpg','������һλ��ѧ��֪��Ҳ�ǡ��綯������˹��֮������¡��˹�˵ľ���ż�񣬸�������Ϊֹһλ����������������ţ�����������һλ��������ɫ�ʵĿ�ѧ�޽���ȴ����������������',30.0,'0',50
exec Book_Add 'Img/img/img/5.jpg','�����ʷ��','Img/img/img/1.jpg,Img/img/img/2.jpg,Img/img/img/3.jpg,Img/img/img/4.jpg,Img/img/img/5.jpg','�ֻ� ͳ�����Ľ̲��Ƽ�ָ���Ķ� �ٻ�������л���������ｱ��ʷѧ����ѧ����ѧ����ѧһ�ε�λ��̨��������ͯ���� �ż�������������ʺϺ����Ķ��ġ�ʷ�ǡ��������Ƽ����ư�',55.0,'0',75
exec Book_Add 'Img/img/img/10.jpg','�����鴫','Img/img/img/6.jpg,Img/img/img/7.jpg,Img/img/img/8.jpg,Img/img/img/9.jpg,Img/img/img/10.jpg','��������Ϊ�������ɺ��Ե�һλŮ��ҵ�ң�һֱ��Ծ�ڴ��ڵ������У����ֻ���������������������Ĵ�ְ�粨��������н�¼��ȵȣ���λ���������簮���й����Ů��ҵ��������̫��Ĺ��¡���������˶�����ĸ�������Ͷ����쵼�����ľ����������ĳ�����һ��Ů��ҵ�ҵ���·����',60.0,'0',70
exec Book_Add 'Img/img/img/11.jpg','�ɴ�Ԫ��ϣ����','Img/img/img/16.jpg,Img/img/img/12.jpg,Img/img/img/13.jpg,Img/img/img/14.jpg,Img/img/img/15.jpg','�ڶ��������ս��������ʷ�Ϲ�ģ��ս��Ϊ����Ӱ��Ϊ��Զ��һ��ս�������ⳡ����˹�뷴����˹�Ľ����У���ս˫����ӿ�ֳ��˷���������ǻ�Ϊ����˹��������Ϊ���ų������ս���ﷸ;��Ϊ���������ɶ���ս����Ϊ������ǧ�ŵ�Ӣ��',32.0,'0',55
exec Book_Add 'Img/img/��������/ͼƬ/25341161-5_u_3.jpg','��Ԫ谴�','Img/img/img/23.jpg,Img/img/img/24.jpg,Img/img/img/26.jpg,Img/img/img/26.jpg,Img/img/img/27.jpg','�������������������ʵ���Ԫ谼�������ɫ�ʵ�һ������������ʷѧ�����������Ĵ�����Ʒ������Ԫ�����ʱ�����������ò����ֶ����𣬵�������ʱ����������°��ж�Ȩ�Ĵ���ս���ٵ�������һͳ���µǶ���λ��ީ������ʱ�龫����Ϊ������ƽ��·Ϊֹ',66.0,'0',88
exec Book_Add 'Img/img/img/28.jpg','��Сƽʱ��','Img/img/img/28.jpg,Img/img/img/29.jpg,Img/img/img/30.jpg,Img/img/img/31.jpg,Img/img/img/32.jpg','��Сƽ���Ӱ�����й���ʷ��������ʷ������Ҳ�ı���ÿһ�����й��˵����ˡ������Сƽ���������ļ�����Ϊ�߼������ǽ�������й�������������˱������ʷ���',99.0,'0',119
exec Book_Add 'Img/img/��������/��������/33.jpg','�Ʊ��Դ�','Img/img/img/33.jpg,Img/img/img/34.jpg,Img/img/img/35.jpg,Img/img/img/36.jpg,Img/img/img/37.jpg','�����;�����������ǿƱȡ��������ص��Դ���Ҳ�������Լ��������ĵ�Ωһһ��ȫ���ܽᡣ�����ԡ����;���Ϊ��ּ���������߽���Ʊȵľ������磬������λ����ʷ�ϴ������ǵĳɹ����ܡ�ȫ��֡��������͡����ա����󲿷�',44.0,'0',66
exec Book_Add 'Img/img/img/38.jpg','���˴�','Img/img/img/38.jpg,Img/img/img/39.jpg,Img/img/img/40.jpg,Img/img/img/41.jpg,Img/img/img/42.jpg','�����˴����ɱ���ҡ��׿������޺��ж�˹̩�������˵Ĵ�����ɣ����Ƕ���������ʷ�ϼ�����Ŷ�������ΰ�ĵ�������߽�������ס����λ�����ҵĹ�֮ͬ���������̻������ڿ��������ٵ�������;���������Ѷ����ĳ��Ե���·���̣�͹�����ǳ�ߵ��˸񡢲�������к͹������ؽ󣬴Ӷ���д��һ�ڡ�Ӣ�۽�������������Ϊ������Ӣ�۴��ǡ���Ҳ�ơ�������������',33.0,'0',55
exec Book_Add 'Img/img/img/38.jpg','���˴�','Img/img/img/38.jpg,Img/img/img/39.jpg,Img/img/img/40.jpg,Img/img/img/41.jpg,Img/img/img/42.jpg','�����˴����ɱ���ҡ��׿������޺��ж�˹̩�������˵Ĵ�����ɣ����Ƕ���������ʷ�ϼ�����Ŷ�������ΰ�ĵ�������߽�������ס����λ�����ҵĹ�֮ͬ���������̻������ڿ��������ٵ�������;���������Ѷ����ĳ��Ե���·���̣�͹�����ǳ�ߵ��˸񡢲�������к͹������ؽ󣬴Ӷ���д��һ�ڡ�Ӣ�۽�������������Ϊ������Ӣ�۴��ǡ���Ҳ�ơ�������������',33.0,'0',55
exec Book_Add 'Img/img/img/10.jpg','�����鴫','Img/img/img/6.jpg,Img/img/img/7.jpg,Img/img/img/8.jpg,Img/img/img/9.jpg,Img/img/img/10.jpg','��������Ϊ�������ɺ��Ե�һλŮ��ҵ�ң�һֱ��Ծ�ڴ��ڵ������У����ֻ���������������������Ĵ�ְ�粨��������н�¼��ȵȣ���λ���������簮���й����Ů��ҵ��������̫��Ĺ��¡���������˶�����ĸ�������Ͷ����쵼�����ľ����������ĳ�����һ��Ů��ҵ�ҵ���·����',60.0,'0',70
exec Book_Add 'Img/img33333/�ƾ�/2/4.jpg','�����Ǵ�','Img/img33333/�ƾ�/2/4.jpg,Img/,Img/,Img/,Img/','֪���ƾ�������������ʱʮ�꣬�ذ�֮������Ȩ�������ḻ������ʵ�������Ǵ��ǣ����������ǵ����������澫�ʵ�һ�� �����滭 ���ﴫ�� ÿ100��40 ����">֪���ƾ�������������ʱʮ�꣬�ذ�֮������Ȩ�������ḻ������ʵ�������Ǵ�',45.0,'0',55
exec Book_Add 'Img/img33333/�ƾ�/3/1.jpg','���ƣ�δ������','Img/img33333/�ƾ�/3/1.jpg,Img/,Img/,Img/,Img/','������Ȩ�������Ͱ�δ��ս����Ʒ��ȫ��չ�ְ���Ͱ͵���ҵ�߼�������֣� ����������ն���������־100��50">������Ȩ�������Ͱ�δ��ս����Ʒ��ȫ��չ�ְ���',66.0,'0',77
exec Book_Add 'Img/img33333/�ƾ�/4/1.jpg','��ʱ����','Img/img33333/�ƾ�/4/1.jpg,Img/,Img/,Img/,Img/','��ʱ���ױ���Ȩ�°洫�ǡ��������ӡ���������������������־��ҵ�����󣬰�ÿһ�찲�źã����Ƕ����������Ρ� �����滭 ���ﴫ�� ÿ100��40 ����">��ʱ���ױ���Ȩ�°洫�ǡ��������ӡ���������������������',24.0,'0',33
exec Book_Add 'Img/img33333/�ƾ�/5/1.jpg','�׾�����վ�ڷ����','Img/img33333/�ƾ�/5/1.jpg,Img/,Img/,Img/,Img/','�����IT��ģ�׾��������к��С���ܷɶ�Զ��ֱ�ӻ���Ͷ����500��Ҵ�ҵ��˾��Ц�����ܻ�ͷ�Ĵ�Ͷ֮·��������������е�����ɳ�ʷ����Ȩ�����ձ��������������� �����滭 ���ﴫ�� ÿ100��40 ����">�����IT��ģ�׾��������к��С���ܷɶ�Զ��',33.0,'0',44
exec Book_Add 'Img/img/img/11.jpg','�ɴ�Ԫ��ϣ����','Img/img/img/16.jpg,Img/img/img/12.jpg,Img/img/img/13.jpg,Img/img/img/14.jpg,Img/img/img/15.jpg','�ڶ��������ս��������ʷ�Ϲ�ģ��ս��Ϊ����Ӱ��Ϊ��Զ��һ��ս�������ⳡ����˹�뷴����˹�Ľ����У���ս˫����ӿ�ֳ��˷���������ǻ�Ϊ����˹��������Ϊ���ų������ս���ﷸ;��Ϊ���������ɶ���ս����Ϊ������ǧ�ŵ�Ӣ��',32.0,'0',55
exec Book_Add 'Img/img/img/28.jpg','��Сƽʱ��','Img/img/img/28.jpg,Img/img/img/29.jpg,Img/img/img/30.jpg,Img/img/img/31.jpg,Img/img/img/32.jpg','��Сƽ���Ӱ�����й���ʷ��������ʷ������Ҳ�ı���ÿһ�����й��˵����ˡ������Сƽ���������ļ�����Ϊ�߼������ǽ�������й�������������˱������ʷ���',99.0,'0',119
exec Book_Add 'Img/img33333/����/2/1.jpg','�ӵ�����','Img/img33333/����/2/1.jpg,Img/,Img/,Img/,Img/','ȫ��13�� ���;���С˵��Ʒȫ�����һ���ӵ� �ؾ�����/����/�ѻ�������/������/�ӵ�����/Σ���ķ�/���г��ʵ� ',10.0,'0',20
exec Book_Add 'Img/img33333/����/3/1.jpg','ս����','Img/img33333/����/3/1.jpg,Img/,Img/,Img/,Img/','ս����+������+������+�����Լ��+�����+��˼¼+��������ۣ�ȫ�߲ᣩ������ά�ĵ��� ������ѧʷ����С˵�鼮���������������۵ĵ��֮��',15.0,'0',20
exec Book_Add 'Img/img33333/����/4/1.jpg','���г���','Img/img33333/����/4/1.jpg,Img/,Img/,Img/,Img/','���;���С˵һ��չ�ֹ����ع�������Ѫ��������С˵����С˵�鼮���;���С˵����ȫ��֮һ">���;���С˵һ��չ�ֹ����ع�������Ѫ��������С˵����С˵',22.0,'0',30
exec Book_Add 'Img/img33333/����/5/1.jpg','������������','Img/img33333/����/5/1.jpg,Img/,Img/,Img/,Img/','����ʷ����¶ ��ʷ��ʤ�鹹 ��ʷ�о������������� ��������Һ���ս�Է�˼">����ʷ����¶ ��ʷ��ʤ�鹹 ��ʷ�о������������� ������',66.0,'0',88
exec Book_Add 'Img/img/img/5.jpg','�����ʷ��','Img/img/img/1.jpg,Img/img/img/2.jpg,Img/img/img/3.jpg,Img/img/img/4.jpg,Img/img/img/5.jpg','�ֻ� ͳ�����Ľ̲��Ƽ�ָ���Ķ� �ٻ�������л���������ｱ��ʷѧ����ѧ����ѧ����ѧһ�ε�λ��̨��������ͯ���� �ż�������������ʺϺ����Ķ��ġ�ʷ�ǡ��������Ƽ����ư�',55.0,'0',75
exec Book_Add 'Img/img/��������/ͼƬ/25341161-5_u_3.jpg','��Ԫ谴�','Img/img/img/23.jpg,Img/img/img/24.jpg,Img/img/img/26.jpg,Img/img/img/26.jpg,Img/img/img/27.jpg','�������������������ʵ���Ԫ谼�������ɫ�ʵ�һ������������ʷѧ�����������Ĵ�����Ʒ������Ԫ�����ʱ�����������ò����ֶ����𣬵�������ʱ����������°��ж�Ȩ�Ĵ���ս���ٵ�������һͳ���µǶ���λ��ީ������ʱ�龫����Ϊ������ƽ��·Ϊֹ',66.0,'0',88
exec Book_Add 'Img/img33333/��ʷ/2/1.jpg','�ǳ���','Img/img33333/��ʷ/2/1.jpg,Img/,Img/,Img/,Img/','��������ǩ���棡��Ƭ����ʷ��ɽ֮�����Ժ��桢��Ѫ�Ļ�����Ƭ���ִ����벻������ʷ���',15.0,'0',30
exec Book_Add 'Img/img33333/��ʷ/3/1.jpg','����������','Img/img33333/��ʷ/3/1.jpg,Img/,Img/,Img/,Img/','�л�������ͳ����������ǧ�����˥������ǿ������������������磬ƾ����Ǻ���������������ʱ��Ϊ�ߣ����Ļ�����Ϊ�᣻��һ��Ӱ��������л�������΢�Ͱٿ�ȫ��">�л�������ͳ����������ǧ�����˥������ǿ���������������',55.0,'0',75
exec Book_Add 'Img/img33333/��ʷ/4/2.jpg','�Һ��ҵ����','Img/img33333/��ʷ/4/2.jpg,Img/,Img/,Img/,Img/','70���꣬7λ���ݣ�7�ι��£��㼯�ж��й���˲�� �й���Ӱ��֮������70���� ������������Ƽ����� �ҵľ�����ն�',15.0,'0',30
exec Book_Add 'Img/img33333/��ʷ/5/1.jpg','ȫ��ͨʷ','Img/img33333/��ʷ/5/1.jpg,Img/,Img/,Img/,Img/','�й�����200��ᣬ�޶����������ٷ�����ͼƬ�����������ĵ�ͼ���㽫����һ�������ʹ��ڣ�ȴ������������ӵ���ʵ����',66.0,'0',88
exec Book_Add 'Img/img/img/5.jpg','�����ʷ��','Img/img/img/1.jpg,Img/img/img/2.jpg,Img/img/img/3.jpg,Img/img/img/4.jpg,Img/img/img/5.jpg','�ֻ� ͳ�����Ľ̲��Ƽ�ָ���Ķ� �ٻ�������л���������ｱ��ʷѧ����ѧ����ѧ����ѧһ�ε�λ��̨��������ͯ���� �ż�������������ʺϺ����Ķ��ġ�ʷ�ǡ��������Ƽ����ư�',55.0,'0',75
exec Book_Add 'Img/img33333/ͯ��/1/2.jpg','С��ǮǮ','Img/img33333/ͯ��/1/2.jpg,Img/,Img/,Img/,Img/','һ��ͯ��������ƹ��£�һ��û�л���ķ羰����С��ǮǮ��һ�����棬�ܵ��˹����ߵ�ϲ���������ǻ۽��������õĹ���������뺢�ӵ��Ժ����ɳ�����һ�ζ�����ʱ�⣬���ǲ�����Ĺ��̡�',20.0,'0',30
exec Book_Add 'Img/img33333/ͯ��/2/1.jpg','Ϊ���Լ�����','Img/img33333/ͯ��/2/1.jpg,Img/,Img/,Img/,Img/','��������10�꣬������������150000����Ӫ���ڱ����� һ������һ���� ����ͯ��ÿ��100��40">��������10�꣬������������150000����Ӫ���ڱ�����',10.0,'0',15
exec Book_Add 'Img/img33333/ͯ��/3/1.jpg','д�����ӵ���ѧ������','Img/img33333/ͯ��/3/1.jpg,Img/,Img/,Img/,Img/','����д�����ӵ���ѧ�����顷��7-8����������ҳ���·����༭�Ƽ����ڵĹ�������">����д�����ӵ���ѧ�����顷��7-8����',66.0,'0',88
exec Book_Add 'Img/img33333/ͯ��/4/3.jpg','��δ������','Img/img33333/ͯ��/4/3.jpg,Img/,Img/,Img/,Img/','�ж�����ǿ��������ʱ���к����������һ��������ʵ�������־�顣">�ж�����ǿ��������ʱ���к����������һ��������ʵ�������־��',22.0,'0',33
exec Book_Add 'Img/img33333/ͯ��/5/4.jpg','��������','Img/img33333/ͯ��/5/4.jpg,Img/,Img/,Img/,Img/','��������ʤ�����˵�̣������ձ�ͯ���磬���Сѧ�е��꼶���ӣ�����������̽��������飬Ҳ������ϵ��ͯС˵">����������ʤ�����˵�̣������ձ�ͯ���磬���Сѧ��',50.0,'0',60
exec Book_Add 'Img/img/iimg/4/1.jpg','���Ƴɳ�','Img/img/iimg/4/1.jpg,Img/img/iimg/4/2.jpg,Img/img/iimg/4/3.jpg,Img/img/iimg/4/4.jpg,Img/img/iimg/4/5.jpg','����ɳ���ʦ���������Թ���˧��������������ʱ��ԾǨ�ĸ�Ч�ɳ������ۣ�������֪������ʵ�������ɱ䡣���ԡ����Ƴɳ�����������΢����������1.1���Ķ���">����ɳ���ʦ���������Թ���˧��������������ʱ��ԾǨ...',55.0,'0',77
exec Book_Add 'Img/img33333/����/1/3.jpg','���˼��','Img/img33333/����/1/3.jpg,Img/,Img/,Img/,Img/','���ζ�ǰȫ��CEO�ײ�ְ�������������������ߵľ��������߿����١�����˹̹ɭ���������飡">���ζ�ǰȫ��CEO�ײ�ְ������������',15.0,'0',19
exec Book_Add 'Img/img33333/����/2/2.jpg','������ʵ��','Img/img33333/����/2/2.jpg,Img/,Img/,Img/,Img/','�����³�˵���110���������У������Ʒ��ɫ�� ����������ն���������־100��50">�����³�˵���110����������',30.0,'0',40
exec Book_Add 'Img/img33333/����/3/1.jpg','����Ӫ��','Img/img33333/����/3/1.jpg,Img/,Img/,Img/,Img/','��Ӫ������ʹ������Ϊ���࣡��������ս����ѯ��˾ModelPeople�ܲá����״�ѧMBAӪ���γ�����߿���������³��˹��20��ʵ������ܽᣬ�ְ��ֽ������ʵ�ֵͳɱ�����ʽ����������">��Ӫ������ʹ������Ϊ���࣡',10.0,'0',15
exec Book_Add 'Img/img33333/����/4/1.jpg','�ͷ��մ�ҵ','Img/img33333/����/4/1.jpg,Img/,Img/,Img/,Img/','��ҵ�鼮����ҵά�裬�������ⴴҵ����Ƚ����ѱ�ʽ��ҵ�����������������еĴ�ҵ6���ķ������Ƕ���5��ʵ��1500��+�û���ָ���������İ���',40.0,'0',50
exec Book_Add 'Img/img33333/����/5/1.jpg','�ؼ�','Img/img33333/����/5/1.jpg,Img/,Img/,Img/,Img/','�̡���Ϊ������������֮�󣬻�Ϊ��˾��һ����ѵ�̲Ķ��⹫��,�ٷ���Ȩ���������������������ʡ�������������������Ƽ���һ������������ǻ�Ϊ������ѧ�ĺ��Ŀ�ܣ�׷�ݻ�Ϊ��֯����֮Դ',33.0,'0',44
exec Book_Add 'Img/img/iimg/5/2.jpg','�������к�','Img/img/iimg/5/1.jpg,Img/img/iimg/5/2.jpg,Img/img/iimg/5/3.jpg,Img/img/iimg/5/4.jpg,Img/img/iimg/5/5.jpg','�����鴴ʼ��÷ɪ��������ɽ֮��/һ���к������Ļ���ϵ�����չ��£���������������Ĭ���������ů���ѹ�Ӣͯ��ݳ�Ʒ��',15.0,'0',25
exec Book_Add 'Img/img33333/����/1/1.jpg','���������','Img/img33333/����/1/1.jpg,Img/,Img/,Img/,Img/','ȫ��100��λר�Ҷ�����������ʱ13������ֽ�ϲ���ݣ����ɴ�����ͥ�������顣�������������Ĵ���������������',44.0,'0',66
exec Book_Add 'Img/img33333/����/2/1.jpg','���ո�������','Img/img33333/����/2/1.jpg,Img/,Img/,Img/,Img/','���ո������ܣ�����桢��쳶����׿������ޣ���װ��3�ᣩ���ո�����������������ȫ���ϰټҲ���ݺ��ղؼ���Ȩ����ʱ10������ֽ�ϲ���ݣ����ɴ�����ͥ�������顣">���ո������ܣ�����桢��쳶����׿�������',55.0,'0',66
exec Book_Add 'Img/img33333/����/3/1.jpg','����ȡ��ͼ��','Img/img33333/����/3/1.jpg,Img/,Img/,Img/,Img/','���μǱڻ�������ȡ��ͼ��324��ȫ������,446������ڻ�ͼ,ϵͳ��ԭ���αڻ�ȡ��ͼ��,ֱ��չʾ����ʱ��ȡ������',36.0,'0',55
exec Book_Add 'Img/img33333/����/4/2.jpg','�鷨û������','Img/img33333/����/4/2.jpg,Img/,Img/,Img/,Img/','���鷨û�����ܡ��ٳ���ر�������ӹ2018���Ķ��鵥�Ƽ��������ݵ�װ֡2018��*���ĵ�һ���������鷨�ҿܿ������������Ժڰ������е��ͷ�������',21.0,'0',30
exec Book_Add 'Img/img33333/����/5/1.jpg','��Ϊ��������','Img/img33333/����/5/1.jpg,Img/,Img/,Img/,Img/','��������8.7,�������ձ������������Ŵ����ר�� ����10��+�Ķ��������� ����ִ�������������ʮ���һ�������ָ���ϼ���ʦ֮������¼�ֻ��ͼ������ָ���ٷ�����������ǩ">��������8.7,�������ձ������������Ŵ����ר�� ����10��+�Ķ���������',55.0,'0',66
exec Book_Add 'Img/img/iimg/2/1.jpg','����','Img/img/iimg/2/1.jpg,Img/img/iimg/2/2.jpg,Img/img/iimg/2/3.jpg,Img/img/iimg/2/4.jpg,Img/img/iimg/2/2.jpg','(֪�����Ұ׷���˪�ഺְ���������Ƽ����١����¡�½���ȳ��������Ҷ����Ƽ�������ʵ��������������ڶ�����թ��������ӣ����еļ���ʩѹ��������������ǳɳ�����',55.0,'0',70
exec Book_Add 'Img/img33333/�ഺ��ѧ/1/1.jpg','���ǳ����Ļ�ϲ','Img/img33333/�ഺ��ѧ/1/1.jpg,Img/,Img/,Img/,Img/','������ů��ϵ���ҹ���֮��Ц���֮�������������˵İ������¡��������ʮɫ��������������ٵĻ�ϲ��Ҳ���������ļ����������۷��⣡����ʱ�⣩ �ҵľ�����ն��� ">����ů��ϵ���ҹ���֮��Ц���֮�������������˵İ�������',55.0,'0',99
exec Book_Add 'Img/img33333/�ഺ��ѧ/2/1.jpg','�ഺ���Σ����ഺ����','Img/img33333/�ഺ��ѧ/2/1.jpg,Img/,Img/,Img/,Img/','���鸽��������ֲᣡ����˫���溣����������������¬˼�ơ������������岩�Ķ��Ƽ�������ص���Щ��ǧ�����������ĸ߿����ص�������Ϊ��ҵңң����ת�۾͸���������У԰�� ">���鸽��������ֲᣡ����˫���溣����',88.0,'0',100
exec Book_Add 'Img/img33333/�ഺ��ѧ/3/1.jpg','��Ŀ������','Img/img33333/�ഺ��ѧ/3/1.jpg,Img/,Img/,Img/,Img/','ֻҪ��������ˣ��Ͳ��ٻ��ǹ���һ���ˡ��ձ����ü��������̴��Ҹж�ǧ�����ѵĳ�����ϵ�������й��״��շ�������Ȩ������С˵���� ">ֻҪ��������ˣ��Ͳ��ٻ��ǹ���һ���ˡ��ձ����ü��������̴��Ҹ�',120.0,'0',150
exec Book_Add 'Img/img33333/�ഺ��ѧ/4/1.jpg','ǡ�ƺ���������','Img/img33333/�ഺ��ѧ/4/1.jpg,Img/,Img/,Img/,Img/','�������ȫ����Ʒ��������Ժԭ����ѧ���ư��λ�������뽾������������������������Ļ𻨣� ">�������ȫ����Ʒ��������Ժԭ����ѧ���ư��λ�������뽾��������',68.0,'0',88
exec Book_Add 'Img/img33333/�ഺ��ѧ/5/1.jpg','���ӳ�һ�','Img/img33333/�ഺ��ѧ/5/1.jpg,Img/,Img/,Img/,Img/','�����ơ�ͬһ������Ʒ�����������������ҡ����ϡ�ȼ����ף�����ԭ���������󼶡�������������������������۽��TOP1�����Ӱ���ѳ��ģ����鸽��8��ˮ��������+��ǩ�� ">�����ơ�ͬһ������Ʒ',33.0,'0',63
exec Book_Add 'Img/img/iimg/1/1.jpg','��������','Img/img/iimg/1/1.jpg,Img/img/iimg/1/2.jpg,Img/img/iimg/1/3.jpg,Img/img/iimg/1/4.jpg,Img/img/iimg/1/5.jpg','60�췢��60��ᣡé����ѧ����������������������ܹ�עͼ����鹹����������TOP1����ս���˲������֮�����������ԵĻ��������',60.0,'0',80
exec Book_Add 'Img/img33333/С˵/1/2.jpg','����','Img/img33333/С˵/1/2.jpg,Img/,Img/,Img/,Img/','�ҽ����������⣬���ܾ����˵İ��š�é����ѧ������Ʊ�񽱣���Ǵ�������Ī���Ƴ硰ֵ�����ǽ������������飬��������ӳ���й���һ�����͵�����',12.0,'0',24
exec Book_Add 'Img/img33333/С˵/2/1.jpg','����','Img/img33333/С˵/2/1.jpg	,Img/,Img/,Img/,Img/','ȫ���� �������������������ײ��������������Ʒ��Ԥ����Ʒ ">ȫ���� �������������������ײ��������������Ʒ',33.0,'0',66
exec Book_Add 'Img/img33333/С˵/3/1.jpg','����','Img/img33333/С˵/3/1.jpg,Img/,Img/,Img/,Img/','�໪���ҹ������������ң�Ҳ�����������С˵�ң����ٻ��ڶ�����⽱������š��������������ȫ��㷺������������ǧ��ᣬ������ձ�������ѳ�Ϊ�й��������統����ѧ�ľ��䡣 ">�໪���ҹ������������ң�Ҳ�����������С˵�ң�',85.0,'0',105
exec Book_Add 'Img/img33333/С˵/4/1.jpg','ʧ��԰','Img/img33333/С˵/4/1.jpg,Img/,Img/,Img/,Img/','�ɱߴ�һ�������������۾��ձ����������а���ף��ɺ�ľͫ��������˾���ݵĵ�Ӱ������ʧ��԰���ȡ��˴ε�ȫ�����ٻ��뱾����������ζ��һ���Ķɱߴ�һ����һ����ʧ��԰',65.0,'0',85
exec Book_Add 'Img/img33333/С˵/5/1.jpg','�߳�','Img/img33333/С˵/5/1.jpg,Img/,Img/,Img/,Img/','����ĺ���������ʥ��֮����20��������С˵��ǿ�ڶ������������40�������Ե�*�������������������ʫ���봿������д�����������������������ļ���',89.0,'0',109
exec Book_Add 'Img/img/img/17.jpg','��˹���Դ�','Img/img/img/18.jpg,Img/img/img/19.jpg,Img/img/img/20.jpg,Img/img/img/21.jpg,Img/img/img/22.jpg','������һλ��ѧ��֪��Ҳ�ǡ��綯������˹��֮������¡��˹�˵ľ���ż�񣬸�������Ϊֹһλ����������������ţ�����������һλ��������ɫ�ʵĿ�ѧ�޽���ȴ����������������',30.0,'0',50
exec Book_Add 'Img/img33333/�Ƽ�/2/1.jpg','����֮��','Img/img33333/�Ƽ�/2/1.jpg,Img/,Img/,Img/,Img/','Ӣ���׶���Ȼ����ݹݳ��Ƽ��������齲��Ũ���Ĳ����ʷ��������չ�����෢����Ȼ�����̽�յ�ͼ',59.0,'0',79
exec Book_Add 'Img/img33333/�Ƽ�/3/1.jpg','����','Img/img33333/�Ƽ�/3/1.jpg,Img/,Img/,Img/,Img/','����70�ܡ�ŦԼʱ�������а�ھ�������80����ȫ��������500��ᡣ��ʱ���ܿ�������ѧ�����ˡ���������ͼ���ʢ�ޣ��й���ѧԺ���������Ĺ�ר�ҳ����Ƽ�',88.0,'0',108
exec Book_Add 'Img/img33333/�Ƽ�/4/1.jpg','���ü���������','Img/img33333/�Ƽ�/4/1.jpg,Img/,Img/,Img/,Img/','��ʱ���ʷ�������󼶳������ն�����������Ƽ���������������ϲ�����������档������������������գ��ٻ�����ˡ�2016��Ⱥ��顱������Χ�Ľ�ͼ�齱������',65.0,'0',95
exec Book_Add 'Img/img33333/�Ƽ�/5/1.jpg','ʱ�����״','Img/img33333/�Ƽ�/5/1.jpg,Img/,Img/,Img/,Img/','�ڰ˽��Ľ򽱻�ͼ�顱 �� �ⲻ��һ���飬����һ��ȫ�µ�����ۣ� ">���ڰ˽��Ľ򽱻�ͼ�顱',45.0,'0',75
exec Book_Add 'Img/img/iimg/4/1.jpg','���Ƴɳ�','Img/img/iimg/4/1.jpg,Img/img/iimg/4/2.jpg,Img/img/iimg/4/3.jpg,Img/img/iimg/4/4.jpg,Img/img/iimg/4/5.jpg','����ɳ���ʦ���������Թ���˧��������������ʱ��ԾǨ�ĸ�Ч�ɳ������ۣ�������֪������ʵ�������ɱ䡣���ԡ����Ƴɳ�����������΢����������1.1���Ķ���">����ɳ���ʦ���������Թ���˧��������������ʱ��ԾǨ...',55.0,'0',77

