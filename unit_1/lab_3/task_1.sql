/* When your new user is created, you can get ” ORA-01950: no privileges
on tablespace ” error during Insert operation. */
GRANT UNLIMITED TABLESPACE TO AKapturov;

create table t
  ( a int,
    b varchar2(4000) default rpad('*',4000,'*'),  -- there will be 4000 '*'
    c varchar2(3000) default rpad('*',3000,'*')
   );

insert into t (a) values ( 1);
insert into t (a) values ( 2);
insert into t (a) values ( 3);
commit;

select * from t;

delete from t where a = 2 ;
commit;

select * from t;

insert into t (a) values ( 4);
commit;

select a from t;

drop table t;

purge recyclebin;
