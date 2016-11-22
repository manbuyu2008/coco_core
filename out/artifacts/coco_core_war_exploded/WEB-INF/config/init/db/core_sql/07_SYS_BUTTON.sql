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
is 'ϵͳ������ť';
-- Add comments to the columns 
comment on column SYS_BUTTON.ID
is 'ID';
comment on column SYS_BUTTON.CODE
is '����';
comment on column SYS_BUTTON.NAME
is '����';
comment on column SYS_BUTTON.BTNICON
is 'Icon';
comment on column SYS_BUTTON.METHODNAME
is 'METHOD';
comment on column SYS_BUTTON.STATUS
is '�Ƿ�����';
comment on column SYS_BUTTON.NOTE
is '��ע';
comment on column SYS_BUTTON.LAST_TIME
is '����޸�ʱ��';
comment on column SYS_BUTTON.VERSION
is '�汾��';
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_BUTTON add primary key (ID);
alter table SYS_BUTTON add constraint U_SYS_BUTTON_CODE unique (CODE);
