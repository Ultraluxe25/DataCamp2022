CREATE TABLE emp AS
SELECT
  object_id empno
, object_name ename
, created hiredate
, owner job
FROM
  all_objects 
/

SELECT * FROM emp;  -- view of whole emp table
SELECT COUNT(empno) FROM emp;  -- there are 60702 lines

alter table emp add constraint emp_pk primary key(empno);

begin
  dbms_stats.gather_table_stats( user, 'EMP', cascade=>true );
end;

CREATE TABLE heap_addresses
  (
    empno REFERENCES emp(empno) ON DELETE CASCADE
  , addr_type VARCHAR2(10)
  , street    VARCHAR2(20)
  , city      VARCHAR2(20)
  , state     VARCHAR2(2)
  , zip       NUMBER
  , PRIMARY KEY (empno,addr_type)
  )
/

SELECT * FROM heap_addresses;  -- oracle write a mistake. It says that i didn't create this table

CREATE TABLE iot_addresses
  (
    empno REFERENCES emp(empno) ON DELETE CASCADE
  , addr_type VARCHAR2(10)
  , street    VARCHAR2(20)
  , city      VARCHAR2(20)
  , state     VARCHAR2(2)
  , zip       NUMBER
  , PRIMARY KEY (empno,addr_type)
  )
  ORGANIZATION INDEX
/

SELECT * FROM iot_addresses;

INSERT INTO heap_addresses
SELECT empno, 'WORK' , '123 main street' , 'Washington' , 'DC' , 20123 FROM emp;
  
INSERT INTO iot_addresses
SELECT empno , 'WORK' , '123 main street' , 'Washington' , 'DC' , 20123 FROM emp;
--
INSERT INTO heap_addresses
SELECT empno, 'HOME' , '123 main street' , 'Washington' , 'DC' , 20123 FROM emp;
  
INSERT INTO iot_addresses
SELECT empno, 'HOME' , '123 main street' , 'Washington' , 'DC' , 20123 FROM emp;
--
INSERT INTO heap_addresses
SELECT empno, 'PREV' , '123 main street' , 'Washington' , 'DC' , 20123 FROM emp;
  
INSERT INTO iot_addresses
SELECT empno, 'PREV' , '123 main street' , 'Washington' , 'DC' , 20123 FROM emp;
--
INSERT INTO heap_addresses
SELECT empno, 'SCHOOL' , '123 main street' , 'Washington' , 'DC' , 20123 FROM emp;
  
INSERT INTO iot_addresses
SELECT empno, 'SCHOOL' , '123 main street' , 'Washington' , 'DC' , 20123 FROM emp;

Commit;

SELECT * FROM iot_addresses;
SELECT COUNT(empno) FROM iot_addresses;  -- 242808  entries

SELECT * FROM heap_addresses;
SELECT COUNT(empno) FROM heap_addresses;

exec dbms_stats.gather_table_stats( user, 'HEAP_ADDRESSES' );  -- You should write 'user' as first atribute's value
exec dbms_stats.gather_table_stats( user, 'IOT_ADDRESSES' );

SELECT *
   FROM emp ,
        heap_addresses
  WHERE emp.empno = heap_addresses.empno
  AND emp.empno   = 42;

SELECT *
   FROM emp ,
        iot_addresses
  WHERE emp.empno = iot_addresses.empno
  AND emp.empno   = 42; 

