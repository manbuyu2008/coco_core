create or replace function FUNC_NEXTID(tablename in varchar2) return number is
  nextid number(12);
begin
  begin
    select nvl(max(id), -1)
      into nextid
      from tSequence
     where upper(name) = upper(tablename);
  exception
    when no_data_found then
      nextid := 0;
      commit;
  end;
  if nextid = -1 then
    INSERT INTO tsequence (name, id) VALUES (upper(tablename), 1);
    nextid := 1;
  else
    update tSequence set id = id + 1 where upper(name) = upper(tablename);
    select nvl(max(id), -1)
      into nextid
      from tSequence
     where upper(name) = upper(tablename);
  end if;
  return(nextid);
end FUNC_NEXTID;
/
