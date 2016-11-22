CREATE TABLESPACE GH_BPM_DATA DATAFILE 'E:\app\Administrator\product\11.2.0\db\ORCL\livebos2.dbf' SIZE 5M 
AUTOEXTEND ON NEXT 1M EXTENT MANAGEMENT LOCAL UNIFORM SIZE 512K ;

DROP USER SMP_BPM;

CREATE USER SMP_BPM  IDENTIFIED BY "sa"
 DEFAULT TABLESPACE "GH_BPM_DATA"
 TEMPORARY TABLESPACE "TEMP"
 PROFILE DEFAULT
 QUOTA UNLIMITED ON "GH_BPM_DATA";
 grant dba,connect,resource to SMP_BPM;