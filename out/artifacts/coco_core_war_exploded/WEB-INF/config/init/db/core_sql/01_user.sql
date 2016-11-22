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
is '用户账号';
-- Add comments to the columns 
comment on column SYS_USER.USER_ID
is 'ID';
comment on column SYS_USER.CODE
is '登录号';
comment on column SYS_USER.NAME
is '名称';
comment on column SYS_USER.PWD
is '密码';
comment on column SYS_USER.DEPT_ID
is '部门';
comment on column SYS_USER.ADMIN_DEPT_ID
is '管理部门';
comment on column SYS_USER.postName
is '职称';
comment on column SYS_USER.OFFICE_TEL
is '办公电话';
comment on column SYS_USER.HOME_TEL
is '住宅电话';
comment on column SYS_USER.MOBILE
is '手机';
comment on column SYS_USER.EMAIL
is '电子邮箱';
comment on column SYS_USER.USER_DESC
is '备注';
comment on column SYS_USER.SEX
is '性别';
comment on column SYS_USER.BIRTHDATE
is '出生日期';
comment on column SYS_USER.PWD_DATE
is '密码初始日期';
comment on column SYS_USER.PRIV_TYPE
is '级别';
comment on column SYS_USER.STATUS
is '状态';
comment on column SYS_USER.ERR_COUNT
is '密码错误次数';
comment on column SYS_USER.LOCK_TIME
is '锁定时间';
comment on column SYS_USER.STOP_INFO
is '停用信息';
comment on column SYS_USER.STOPTIME
is '停用时间';
comment on column SYS_USER.LAST_TIME
is '最后修改时间';
comment on column SYS_USER.VERSION
is '版本号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_USER add primary key (USER_ID);