-- Create table
create table SYS_PRIVILEGE
(
  ID            VARCHAR2(20) not null,
  MASTER        NUMBER(2) default 0 not null,
  MASTERID      VARCHAR2(20) not null,
  MENUID        VARCHAR2(20) not null,
  BUTTONS     VARCHAR2(255),
  USERID        VARCHAR2(20) not null,
  LAST_TIME VARCHAR2(20),
  VERSION   NUMBER(10) default 0 not null
);
-- Add comments to the table 
comment on table SYS_PRIVILEGE
  is '授权表';
-- Add comments to the columns 
comment on column SYS_PRIVILEGE.ID
  is 'ID';
comment on column SYS_PRIVILEGE.MASTER
  is '授权主体';
comment on column SYS_PRIVILEGE.MASTERID
  is '主体ID';
comment on column SYS_PRIVILEGE.MENUID
  is '菜单ID';
comment on column SYS_PRIVILEGE.BUTTONS
  is '授权按钮IDS';
comment on column SYS_PRIVILEGE.USERID
  is '授权人';
comment on column SYS_PRIVILEGE.LAST_TIME
  is '最后修改时间';
comment on column SYS_PRIVILEGE.VERSION
  is '版本号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_PRIVILEGE add primary key (ID);
