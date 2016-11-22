create table HR_USER_CHECK
(
  ID     VARCHAR2(20) not null,
  user_id        VARCHAR2(20) not null,    --用户ID
  check_date        VARCHAR2(10) not null,  --打卡日期
  check_time         VARCHAR2(10),            --打卡时间
  check_type    NUMBER(2) default 1,         --打卡类型  1 上班卡 2 下班卡
  LAST_TIME VARCHAR2(20),
  VERSION   NUMBER(10) default 0 not null
);


--Add comments to the table 
comment on table HR_USER_CHECK
is '用户打卡明细表';
-- Add comments to the columns 
comment on column HR_USER_CHECK.ID
is 'ID';
comment on column HR_USER_CHECK.user_id
is '用户ID';
comment on column HR_USER_CHECK.check_date
is '打卡日期';
comment on column HR_USER_CHECK.check_time
is '打卡时间';
comment on column HR_USER_CHECK.check_type
is '打卡类型';
comment on column SYS_BUTTON.LAST_TIME
is '最后修改时间';
comment on column SYS_BUTTON.VERSION
is '版本号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table HR_USER_CHECK add primary key (ID);