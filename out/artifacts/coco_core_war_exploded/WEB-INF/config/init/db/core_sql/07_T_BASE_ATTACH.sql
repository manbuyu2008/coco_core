-- Create table
create table T_BASE_ATTACH
(
  ID            VARCHAR2(20) not null,
  NAME         VARCHAR2(255) not null,
  SUFFIX        VARCHAR2(20),
  PATH          VARCHAR2(100),
  FILESIZE      NUMBER(10) default 0,
  USERID        VARCHAR2(50),
  TYPE         VARCHAR2(50),
  LAST_TIME VARCHAR2(20),
  VERSION   NUMBER(10) default 0
);
-- Add comments to the table 
comment on table T_BASE_ATTACH
is 'ϵͳ����';
-- Add comments to the columns 
comment on column T_BASE_ATTACH.ID
is 'ID';
comment on column T_BASE_ATTACH.NAME
is '����';
comment on column T_BASE_ATTACH.SUFFIX
is '������׺';
comment on column T_BASE_ATTACH.PATH
is '���·��';
comment on column T_BASE_ATTACH.FILESIZE
is '������С';
comment on column T_BASE_ATTACH.USERID
is '�û�ID';
comment on column T_BASE_ATTACH.TYPE
is '��������';
comment on column T_BASE_ATTACH.LAST_TIME
is '����޸�ʱ��';
comment on column T_BASE_ATTACH.VERSION
is '�汾��';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_BASE_ATTACH add primary key (ID);
