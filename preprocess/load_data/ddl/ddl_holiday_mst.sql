CREATE TABLE work.holiday_mst
(
  target_day             TEXT NOT NULL,
  holidayday_flg         BOOLEAN NOT NULL,
  nextday_is_holiday_flg BOOLEAN NOT NULL
);
COPY work.holiday_mst FROM '/data/holiday_mst.csv'( delimiter ',', format csv, header true );
