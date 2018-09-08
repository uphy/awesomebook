#!/bin/bash

psql(){
  docker-compose exec postgres psql -U postgres -d work -c "$1"
}

cd "$(dirname $0)"
psql 'create schema work'
for name in $(ls -1 ../preprocess/load_data/ddl)
do
  psql "\i /preprocess/load_data/ddl/$name"
done
