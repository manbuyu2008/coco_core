create table SYS_USER
(
  USER_ID     VARCHAR2(20) not null,
  CODE        VARCHAR2(60) not null,
  NAME        VARCHAR2(100) not null,
  PWD         VARCHAR2(32),
  PWD_DATE    VARCHAR2(10),
  PRIV_TYPE  NUMBER(4) default 0,
  DEPT_ID     VARCHAR2(20) not null,
  ADMIN_DEPT_ID  VARCHAR2(255) not null,
  postName       VARCHAR2(255),
  OFFICE_TEL  VARCHAR2(255),
  HOME_TEL    VARCHAR2(255),
  MOBILE      VARCHAR2(255),
  EMAIL       VARCHAR2(255),
  USER_DESC        VARCHAR2(255),
  SEX         NUMBER(4) default 0,
  BIRTHDATE   VARCHAR2(10),
  STATUS      NUMBER(4) default 1,
  ERR_COUNT   NUMBER(4) default 0,
  LOCK_TIME   VARCHAR2(19),
  STOP_INFO   VARCHAR2(255),
  STOPTIME   VARCHAR2(20),
  LAST_TIME VARCHAR2(20),
  VERSION   NUMBER(10) default 0 not null,
  CONSTRAINT u_sys_user UNIQUE (code)
) ;
-- Add comments to the table 
comment on table SYS_USER
is '�û��˺�';
-- Add comments to the columns 
comment on column SYS_USER.USER_ID
is 'ID';
comment on column SYS_USER.CODE
is '��¼��';
comment on column SYS_USER.NAME
is '����';
comment on column SYS_USER.PWD
is '����';
comment on column SYS_USER.DEPT_ID
is '����';
comment on column SYS_USER.ADMIN_DEPT_ID
is '������';
comment on column SYS_USER.postName
is 'ְ��';
comment on column SYS_USER.OFFICE_TEL
is '�칫�绰';
comment on column SYS_USER.HOME_TEL
is 'סլ�绰';
comment on column SYS_USER.MOBILE
is '�ֻ�';
comment on column SYS_USER.EMAIL
is '��������';
comment on column SYS_USER.USER_DESC
is '��ע';
comment on column SYS_USER.SEX
is '�Ա�';
comment on column SYS_USER.BIRTHDATE
is '��������';
comment on column SYS_USER.PWD_DATE
is '�����ʼ����';
comment on column SYS_USER.PRIV_TYPE
is '����';
comment on column SYS_USER.STATUS
is '״̬';
comment on column SYS_USER.ERR_COUNT
is '����������';
comment on column SYS_USER.LOCK_TIME
is '����ʱ��';
comment on column SYS_USER.STOP_INFO
is 'ͣ����Ϣ';
comment on column SYS_USER.STOPTIME
is 'ͣ��ʱ��';
comment on column SYS_USER.LAST_TIME
is '����޸�ʱ��';
comment on column SYS_USER.VERSION
is '�汾��';
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_USER add primary key (USER_ID);