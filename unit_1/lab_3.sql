create tablespace tbs_lab datafile 'db_lab_001.dat' size 5M autoextend ON next 5M MAXSIZE 100M; 
GRANT UNLIMITED TABLESPACE TO AKapturov;
create table t
    (a int,
     b varchar2 (4000) default rpad ('*',4000,'*'),
     c varchar2 (3000) default rpad ('*',3000,'*')
     )
     /
     
 insert into t (a) values (1);
 insert into t (a) values (2);
 insert into t (a) values (3);
 commit;
 delete from t where a=2;
 commit;
 insert into t (a) values (4);
 commit;
 
 select a from t
