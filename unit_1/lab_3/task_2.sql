/* Here big mistake that make problems
ORA-00054: ресурс занят и задано его получение с параметром NOWAIT,
либо истекло время ожидания
I tried to solve it but I didn't  */

Create table t ( x int primary key, y clob, z blob );

select segment_name, segment_type from user_segments;

drop table t;

Create table t 
    ( x int primary key, 
      y clob, 
      z blob ) 
SEGMENT CREATION IMMEDIATE
/

select segment_name, segment_type from user_segments;

SELECT DBMS_METADATA.GET_DDL('TABLE','T') FROM dual
