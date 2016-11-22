-- Create table
create table SYS_MENU
(
  ID            VARCHAR2(20) not null,
  CODE          VARCHAR2(20) not null,
  NAME          VARCHAR2(255) not null,
  PARENTID      VARCHAR2(20) not null,
  LEVELNUM      NUMBER(9) default 0 not null,
  LEVELCODE     VARCHAR2(255) not null,
  MENUORDER     NUMBER(2) default 0 not null,
  ISLEAF        NUMBER(2) default 0 not null,
  MENUURL       VARCHAR2(255),
  MENUICON      VARCHAR2(255),
  STATUS        NUMBER(2) default 0 not null,
  BUTTONS     VARCHAR2(255),
  NOTE          VARCHAR2(255),
  LAST_TIME VARCHAR2(20),
  VERSION   NUMBER(10) default 0 not null
);
-- Add comments to the table 
comment on table SYS_MENU
is '系统菜单';
-- Add comments to the columns 
comment on column SYS_MENU.ID
is 'ID';
comment on column SYS_MENU.CODE
is '编码';
comment on column SYS_MENU.NAME
is '名称';
comment on column SYS_MENU.PARENTID
is '上级ID';
comment on column SYS_MENU.LEVELNUM
is '级次';
comment on column SYS_MENU.LEVELCODE
is '级次编码';
comment on column SYS_MENU.MENUORDER
is '排序';
comment on column SYS_MENU.ISLEAF
is '是否根节点';
comment on column SYS_MENU.MENUURL
is 'URL';
comment on column SYS_MENU.MENUICON
is 'Icon';
comment on column SYS_MENU.STATUS
is '是否启用';
comment on column SYS_MENU.BUTTONS
is '按钮IDS';
comment on column SYS_MENU.NOTE
is '备注';
comment on column SYS_MENU.LAST_TIME
is '最后修改时间';
comment on column SYS_MENU.VERSION
is '版本号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_MENU add primary key (ID);
alter table SYS_MENU add constraint U_SYS_MENU_CODE unique (CODE);
