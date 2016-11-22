create table HR_USER_CHECK
(
  ID     VARCHAR2(20) not null,
  user_id        VARCHAR2(20) not null,    --�û�ID
  check_date        VARCHAR2(10) not null,  --������
  check_time         VARCHAR2(10),            --��ʱ��
  check_type    NUMBER(2) default 1,         --������  1 �ϰ࿨ 2 �°࿨
  LAST_TIME VARCHAR2(20),
  VERSION   NUMBER(10) default 0 not null
);


--Add comments to the table 
comment on table HR_USER_CHECK
is '�û�����ϸ��';
-- Add comments to the columns 
comment on column HR_USER_CHECK.ID
is 'ID';
comment on column HR_USER_CHECK.user_id
is '�û�ID';
comment on column HR_USER_CHECK.check_date
is '������';
comment on column HR_USER_CHECK.check_time
is '��ʱ��';
comment on column HR_USER_CHECK.check_type
is '������';
comment on column SYS_BUTTON.LAST_TIME
is '����޸�ʱ��';
comment on column SYS_BUTTON.VERSION
is '�汾��';
-- Create/Recreate primary, unique and foreign key constraints 
alter table HR_USER_CHECK add primary key (ID);