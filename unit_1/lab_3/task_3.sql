create table emp as 
select
 object_id empno,
 object_name ename,
 created hiredate,
 owner job from all_objects
 /
 alter table emp add constraint emp_pk primary key (empno);
 select * from emp;  -- we output the table
 SELECT COUNT(empno) FROM emp;  -- we found 60702 lines
