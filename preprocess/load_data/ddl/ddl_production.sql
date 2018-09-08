CREATE TABLE work.production_tb
(
  type TEXT NOT NULL,
  length FLOAT NOT NULL,
  thickness FLOAT NOT NULL,
  fault_flg BOOLEAN NOT NULL
);
COPY work.production_tb FROM '/data/production.csv'( delimiter ',', format csv, header true );
