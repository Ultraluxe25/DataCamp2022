CREATE TABLE t2 AS
 SELECT TRUNC( rownum / 100 ) id, rpad( rownum,100 ) t_pad
   FROM dual
  CONNECT BY rownum < 100000;

CREATE INDEX t2_idx1 ON t2
  ( id );

select blocks from user_segments where segment_name = 'T2';

select count(distinct (dbms_rowid.rowid_block_number(rowid))) block_ct from t2 ;

SET autotrace ON;

SELECT COUNT( * )
   FROM t2 ;

DELETE FROM t2;

INSERT INTO t2
  ( ID, T_PAD )
  VALUES
  (  1,'1' );

COMMIT;

select blocks from user_segments where segment_name = 'T2';
select count(distinct (dbms_rowid.rowid_block_number(rowid))) block_ct from t2 ;
SET autotrace ON;
SELECT COUNT( * )
   FROM t2 ;

TRUNCATE TABLE t2;

select blocks from user_segments where segment_name = 'T2';
select count(distinct (dbms_rowid.rowid_block_number(rowid))) block_ct from t2 ;
SET autotrace ON;
SELECT COUNT( * )
   FROM t2 ;
