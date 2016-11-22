create or replace function f_getSpell
(	p_cnStr In varchar2,
	p_sign  In number Default Null	--默认简拼 ，1|全拼（中间有空格）
)

  return varchar2 as

  lv_spell varchar2(200);


begin

  if p_cnStr is null then

    return '';

  end if;
  if(p_sign=1) then --全拼
      select HZPY.GETHZFULLPY(p_cnStr) into lv_spell from dual;
  else --简拼
      select HZPY.HZPYCAP(p_cnStr) into lv_spell from dual;
  end if;
  return(lower(lv_spell));

end;