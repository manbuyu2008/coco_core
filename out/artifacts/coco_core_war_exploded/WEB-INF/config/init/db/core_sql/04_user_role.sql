create table SYS_USER_ROLE
(
  ID          VARCHAR2(20) not null,
  USERID     VARCHAR2(20),
  ROLEID     VARCHAR2(20),
  LAST_TIME VARCHAR2(20),
  VERSION   NUMBER(10) default 0 not null
);
-- Add comments to the table 
comment on table SYS_USER_ROLE
is '�û���ɫ��ϵ��';
-- Add comments to the columns 
comment on column SYS_USER_ROLE.ID
is 'ID';
comment on column SYS_USER_ROLE.USERID
is '����Աid';
comment on column SYS_USER_ROLE.ROLEID
is '��ɫid';
comment on column SYS_USER_ROLE.LAST_TIME
is '����޸�ʱ��';
comment on column SYS_USER_ROLE.VERSION
is '�汾��';
alter table SYS_USER_ROLE add primary key (ID);