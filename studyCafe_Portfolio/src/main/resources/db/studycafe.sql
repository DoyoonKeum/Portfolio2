-- ��������
-- �������� ������ ���� ���������ؼ� �۾� ex)system,sys
create user studycafe
identified by asdf123
default tablespace myts
temporary tablespace temp;

-- spuser���� connect, resource�� �ο�
grant connect, resource, create view
to studycafe;


drop table user_info;


create table user_info(
u_number    number          constraint pk_user_info_member_id primary key,  
u_name      varchar2(50)    constraint nn_user_info_name not null,          
u_id        varchar2(50)    constraint uk_user_info_id unique,              
u_pass      varchar2(50)    constraint nn_user_info_pass not null,          
u_grade     number          constraint nn_user_info_grade not null,        
u_tell      varchar2(50)    constraint nn_user_info_tell not null,          
u_gender    varchar2(10)    constraint nn_user_info_gender not null        
);



drop table article;


create table article(
a_no        number(5)       constraint pk_article_no primary key,   
a_title     varchar2(60)    constraint nn_article_title not null,   
a_content   varchar2(2000)  constraint nn_article_content not null,
a_regdate   date            default sysdate,                        
a_modidate  date            constraint nn_article_modidate null,    
a_cnt       number(5)       constraint nn_article_cnt null,         
a_isshow    varchar2(1)     constraint nn_article_isshow null,       
u_number    number,
u_id varchar2(50),
CONSTRAINT fk_article_number foreign key(u_number) references user_info(u_number),
CONSTRAINT fk_article_id foreign key(u_id) references user_info(u_id)
);
insert into article_comment(a_no,a_title,a_content,a_regdate,a_modidate,a_cnt,a_isshow,u_number,u_id)
values (seq_article.nextval,'테스트','테스트',sysdate,sysdate,0,'Y',1,'hongId');

insert into article(a_no,a_title,a_content,a_regdate,a_modidate,a_cnt,a_isshow,u_number,u_id)
values (seq_article.nextval,'테스트','테스트',sysdate,sysdate,0,'Y',1,'hongId');
com
mit;
drop table article_comment;


create table article_comment(
ac_no       number(5)       constraint pk_article_comment_no primary key,    
ac_content  varchar2(1000)  constraint nn_article_comment_content not null,  
ac_regdate  date            default sysdate,                                 
ac_modidate date            constraint nn_article_comment_modidate null,     
ac_isshow   varchar2(1)     constraint nn_article_comment_isshow null,    
a_no        number(5),
u_number    number,
CONSTRAINT fk_article_comment_no foreign key(a_no) references article(a_no),
CONSTRAINT fk_articlecomment_number foreign key(u_number) references user_info(u_number)
);

select * from article_comment;
insert into article_comment(ac_no,ac_content,ac_regdate,ac_modidate,ac_isshow,a_no)
values (seq_article_comment.nextval,'댓글1',sysdate,sysdate,'Y',123);

			select ac.*
			from (select u.*,a.a_no
			from article a join user_info u on a.u_number=u.u_number
			where a.a_no=145) info join article_comment ac on info.a_no=ac.a_no
			where ac.ac_isshow='Y'
			order by ac.ac_no desc;

select u_id
from user_info u join article a on u.u_number=a.u_number
where ;
a_no

drop sequence seq_article;

create sequence seq_article
start with 1
increment by 1;

create sequence seq_article_comment
start with 1
increment by 1;

insert into article(a_no,a_title,a_content,a_regdate,a_modidate,a_cnt,a_isshow,u_number)
values (seq_article.nextval,'제목관리자1','내용관리자1',sysdate,sysdate,0,'Y',999);
insert into article(a_no,a_title,a_content,a_regdate,a_modidate,a_cnt,a_isshow,u_number)
values (seq_article.nextval,'제목2','내용2',sysdate,sysdate,0,'Y',1);
insert into article(a_no,a_title,a_content,a_regdate,a_modidate,a_cnt,a_isshow,u_number)
values (seq_article.nextval,'제목3','내용3',sysdate,sysdate,0,'Y',1);

insert into article_comment(a_no,a_title,a_content,a_regdate,a_modidate,a_cnt,a_isshow,u_number,u_id)
values (seq_article.nextval,'테스트','테스트',sysdate,sysdate,0,'Y',1,'hongId');


insert into user_info(u_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender)
values (999,'관리자','adminId','1234',999,'010-1234-1234','여');
insert into user_info(u_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender)
values (1,'홍길동','hongId','1234',1,'010-1234-1234','남');

insert into user_info(u_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender)
values (1,'홍길동','hongId','1234',1,'010-1234-1234','남');


update article
set a_modidate = sysdate, a_title='제목'
where a_no=3;


-- ���̺����(ȸ������)
create table user_info(
u_number    number          constraint pk_user_info_member_id primary key,  --ȸ����ȣ
u_name      varchar2(50)    constraint nn_user_info_name not null,          --ȸ���̸�
u_id        varchar2(50)    constraint uk_user_info_id unique,              --���̵�
u_pass      varchar2(50)    constraint nn_user_info_pass not null,          --��й�ȣ
u_grade     number          constraint nn_user_info_grade not null,         --ȸ�����
u_tell      varchar2(50)    constraint nn_user_info_tell not null,          --��ȭ��ȣ
u_gender    varchar2(10)    constraint nn_user_info_gender not null         --����
);



commit;

-- �Խñ���ü��ȸ
select a.*,u.u_id from article a join user_info u on a.u_number=u.u_number
order by a.a_no desc;
-- �Խñ�������ȸ
select a.*,u.u_id from article a join user_info u on a.u_number=u.u_number
where a.a_title like '%����%'
order by a.a_no desc;


select * from user_info;


-- ���̺����(����)
drop table coupon;

-- ���̺����(����)
create table coupon(
c_no    number(6)       constraint pk_coupon_no primary key,    --������ȣ
c_name  varchar2(100)   constraint nn_coupon_name not null,     --�����̸�
c_start date            constraint nn_coupon_start not null,    --��������
c_end   date            constraint nn_coupon_end not null,      --���������
c_price number(6)       constraint nn_coupon_pricenot null,     --���αݾ�
id      varchar2(30),
CONSTRAINT fk_coupon_id foreign key(id) references member(id)
);

select count(a_no) from article order by a_no desc;
select * from(select s.*, row_number()over(order by s.a_no desc) as num from article s)
where num>"+pageDTO.getStartRow()+" and num<"+pageDTO.getEndRow();


select *from(select s.*, row_number()over(order by s.a_no desc) as num from article s) 
where num>(pageNo-1)*5 and num<= pageNo*5
;

commit;

select * from user_info
where u_id='hongId' and u_pass='12354';

select * from article where a_isshow='Y' order by a_no desc
update article
		set a_isshow='N'
		where a_no=129;
        
        
        select a.*,u.u_id from(select s.*, row_number()over(order by s.a_no desc) as num from article s)
			a join user_info u on a.u_number=u.u_number
			where num>0 and num<=5 and a_isshow='Y'
			order by a.a_no desc;
            
            
            
select ac.*,u.u_id
from article_comment ac , article a , user_info u
where ac.ac_no=a.a_no and a.user_number=u.user_number and a.a_no=1;


select ac.*,info.u_id
from (select u.*,a.a_no
from article a join user_info u on a.u_number=u.u_number
where a.a_no=145) info join article_comment ac on info.a_no=ac.a_no
where ac.ac_isshow='Y';
,
on ac.ac_no=a.a_no
order by ac.ac_no;
select * from article_comment;

select ac.*,a.a_no
from article a , user_info u ,article_comment ac
where a.u_number=u.u_number and a.a_no=ac.ac_no and a.a_no=123;

select u.*,a.a_no
from article a join user_info u on a.u_number=u.u_number
where a.a_no=123;

select a.*,u.u_id 
from(select s.*, row_number()over(order by s.a_no desc) as num from article s where a_isshow='Y')
a join user_info u on a.u_number=u.u_number
where num>#{start} and num<=#{end}
order by a.a_no desc





where ac.ac_no=a.a_no and a.user_number=u.user_number and a.a_no=1;
