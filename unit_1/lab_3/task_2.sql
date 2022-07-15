create table t (x int primary key, y clob, z blob) SEGMENT CREATION IMMEDIATE / 
select 
  DBMS_METADATA.GET_DDL('TABLE', 'T') 
from 
  dual;
create table t
    (x int primary key,
     y clob,
     z blob)
SEGMENT CREATION IMMEDIATE 
/
select DBMS_METADATA.GET_DDL('TABLE','T') from dual;

drop table t;
