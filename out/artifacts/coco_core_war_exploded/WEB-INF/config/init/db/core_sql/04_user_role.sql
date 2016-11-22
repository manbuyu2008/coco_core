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
is '用户角色关系表';
-- Add comments to the columns 
comment on column SYS_USER_ROLE.ID
is 'ID';
comment on column SYS_USER_ROLE.USERID
is '操作员id';
comment on column SYS_USER_ROLE.ROLEID
is '角色id';
comment on column SYS_USER_ROLE.LAST_TIME
is '最后修改时间';
comment on column SYS_USER_ROLE.VERSION
is '版本号';
alter table SYS_USER_ROLE add primary key (ID);