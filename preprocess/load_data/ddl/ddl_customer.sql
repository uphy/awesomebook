CREATE TABLE work.customer_tb
(
  customer_id      TEXT NOT NULL,
  age         	   INTEGER NOT NULL,
  sex      		   TEXT NOT NULL,
  home_latitude    FLOAT NOT NULL,
  home_longitude   FLOAT NOT NULL,
  primary key(customer_id)
);
COPY work.customer_tb FROM '/data/customer.csv'( delimiter ',', format csv, header true );
