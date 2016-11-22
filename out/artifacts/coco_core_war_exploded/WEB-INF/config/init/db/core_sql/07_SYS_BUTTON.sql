-- Create table
create table SYS_BUTTON
(
  ID            VARCHAR2(20) not null,
  CODE          VARCHAR2(20) not null,
  NAME          VARCHAR2(255) not null,
  BTNICON      VARCHAR2(255),
  METHODNAME      VARCHAR2(100) not null,
  STATUS        NUMBER(2) default 0,
  NOTE          VARCHAR2(255),
  LAST_TIME VARCHAR2(20),
  VERSION   NUMBER(10) default 0
);
-- Add comments to the table 
comment on table SYS_BUTTON
is '系统操作按钮';
-- Add comments to the columns 
comment on column SYS_BUTTON.ID
is 'ID';
comment on column SYS_BUTTON.CODE
is '编码';
comment on column SYS_BUTTON.NAME
is '名称';
comment on column SYS_BUTTON.BTNICON
is 'Icon';
comment on column SYS_BUTTON.METHODNAME
is 'METHOD';
comment on column SYS_BUTTON.STATUS
is '是否启用';
comment on column SYS_BUTTON.NOTE
is '备注';
comment on column SYS_BUTTON.LAST_TIME
is '最后修改时间';
comment on column SYS_BUTTON.VERSION
is '版本号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_BUTTON add primary key (ID);
alter table SYS_BUTTON add constraint U_SYS_BUTTON_CODE unique (CODE);
