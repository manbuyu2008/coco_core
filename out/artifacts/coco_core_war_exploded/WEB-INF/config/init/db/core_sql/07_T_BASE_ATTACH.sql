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
is '系统附件';
-- Add comments to the columns 
comment on column T_BASE_ATTACH.ID
is 'ID';
comment on column T_BASE_ATTACH.NAME
is '名称';
comment on column T_BASE_ATTACH.SUFFIX
is '附件后缀';
comment on column T_BASE_ATTACH.PATH
is '存放路径';
comment on column T_BASE_ATTACH.FILESIZE
is '附件大小';
comment on column T_BASE_ATTACH.USERID
is '用户ID';
comment on column T_BASE_ATTACH.TYPE
is '附件类型';
comment on column T_BASE_ATTACH.LAST_TIME
is '最后修改时间';
comment on column T_BASE_ATTACH.VERSION
is '版本号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_BASE_ATTACH add primary key (ID);
