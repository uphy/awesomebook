CREATE TABLE work.production_missn_tb
(
  type TEXT NOT NULL,
  length FLOAT NOT NULL,
  thickness FLOAT,
  fault_flg BOOLEAN NOT NULL
);
COPY work.production_missn_tb FROM '/data/production_missing_num_4_redshift.csv'( delimiter ',', format csv, header true );
