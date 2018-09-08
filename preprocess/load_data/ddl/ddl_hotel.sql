CREATE TABLE work.hotel_tb
(
  hotel_id        TEXT NOT NULL,
  base_price      INTEGER NOT NULL,
  big_area_name   TEXT NOT NULL,
  small_area_name TEXT NOT NULL,
  hotel_latitude  FLOAT NOT NULL,
  hotel_longitude FLOAT NOT NULL,
  is_business     BOOLEAN NOT NULL,
  PRIMARY KEY(hotel_id)
);
COPY work.hotel_tb FROM '/data/hotel.csv'( delimiter ',', format csv, header true );
