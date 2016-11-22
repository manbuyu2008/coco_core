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
is '����';
-- Add comments to the columns 
comment on column SYS_DEPT.ID
is 'ID';
comment on column SYS_DEPT.CODE
is '����';
comment on column SYS_DEPT.NAME
is '����';
comment on column SYS_DEPT.PARENTID
is '�ϼ�����';
comment on column SYS_DEPT.LEVELNUM
is '����';
comment on column SYS_DEPT.LEVELCODE
is '���α���';
comment on column SYS_DEPT.DEPTTYPE
is '��������';
comment on column SYS_DEPT.STATUS
is '״̬';
comment on column SYS_DEPT.STOPINFO
is 'ͣ����Ϣ';
comment on column SYS_DEPT.STOPTIME
is 'ͣ��ʱ��';
comment on column SYS_DEPT.NOTE
is '��ע';
comment on column SYS_DEPT.LAST_TIME
is '����޸�ʱ��';
comment on column SYS_DEPT.VERSION
is '�汾��';
alter table SYS_DEPT add primary key (ID);