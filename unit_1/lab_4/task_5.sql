-- first, U should add code from task_2 before code below
CREATE TABLE employees AS
    SELECT *
      FROM scott.emp;

CREATE INDEX idx_emp01 ON employees
      ( empno, ename, job );

SELECT /*+INDEX_SS(emp idx_emp01)*/ emp.* FROM employees emp where ename = 'SCOTT';
SELECT /*+FULL*/ emp.* FROM employees emp WHERE ename = 'SCOTT';
