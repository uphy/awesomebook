CREATE TABLE work.month_mst
(
  year_num          INTEGER NOT NULL,
  month_num         INTEGER NOT NULL,
  month_first_day   TEXT NOT NULL,
  month_last_day    TEXT NOT NULL
);
COPY work.month_mst FROM '/data/month_mst.csv'( delimiter ',', format csv, header true );
