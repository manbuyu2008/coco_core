create table SYS_DEPT
(
  ID          VARCHAR2(20) not null,
  CODE        VARCHAR2(20) not null,
  NAME        VARCHAR2(255) not null,
  PARENTID   VARCHAR2(20),
  LEVELNUM       NUMBER(9) default 0 not null,
  LEVELCODE  VARCHAR2(255) not null,
  DEPTTYPE   VARCHAR2(20),
  STATUS      NUMBER(4) default 0,
  STOPINFO   VARCHAR2(60),
  STOPTIME   VARCHAR2(20),
  NOTE        VARCHAR2(255),
  LAST_TIME VARCHAR2(20),
  VERSION   NUMBER(10) default 0 not null,
  CONSTRAINT u_sys_dept UNIQUE (code)
);
-- Add comments to the table 
comment on table SYS_DEPT
is '部门';
-- Add comments to the columns 
comment on column SYS_DEPT.ID
is 'ID';
comment on column SYS_DEPT.CODE
is '编码';
comment on column SYS_DEPT.NAME
is '名称';
comment on column SYS_DEPT.PARENTID
is '上级部门';
comment on column SYS_DEPT.LEVELNUM
is '级次';
comment on column SYS_DEPT.LEVELCODE
is '级次编码';
comment on column SYS_DEPT.DEPTTYPE
is '部门性质';
comment on column SYS_DEPT.STATUS
is '状态';
comment on column SYS_DEPT.STOPINFO
is '停用信息';
comment on column SYS_DEPT.STOPTIME
is '停用时间';
comment on column SYS_DEPT.NOTE
is '备注';
comment on column SYS_DEPT.LAST_TIME
is '最后修改时间';
comment on column SYS_DEPT.VERSION
is '版本号';
alter table SYS_DEPT add primary key (ID);