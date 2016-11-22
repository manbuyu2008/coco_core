-- Create table
create table SYS_ROLE
(
  ID     VARCHAR2(20) not null,
  CODE        VARCHAR2(20) not null,
  NAME        VARCHAR2(255) not null,
  PRIV        NUMBER(4) default 0,
  DATAPRIV   NUMBER(4) default 0,
  NOTE        VARCHAR2(255),
  LAST_TIME VARCHAR2(20),
  VERSION   NUMBER(10) default 0 not null
);
-- Add comments to the table 
comment on table SYS_ROLE
is '用户角色';
-- Add comments to the columns 
comment on column SYS_ROLE.ID
is 'ID';
comment on column SYS_ROLE.CODE
is '编码';
comment on column SYS_ROLE.NAME
is '名称';
comment on column SYS_ROLE.NOTE
is '描述';
comment on column SYS_ROLE.PRIV
is '用户等级';
comment on column SYS_ROLE.DATAPRIV
is '数据权限';
comment on column SYS_ROLE.LAST_TIME
is '最后修改时间';
comment on column SYS_ROLE.VERSION
is '版本号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_ROLE add primary key (ID);