#!/bin/sh

compose(){
    cd docker
    local name=$1
    shift
    docker-compose exec $name $*
    cd - > /dev/null
}

run_sql(){
    compose postgres psql -U postgres -d work -f "/$1"
}

run_python(){
    compose jupyter python "$1"
}

run_R(){
    local filename=$(basename "$1")
    cp "$1" . || exit 1
    compose jupyter Rscript "$filename"
    local result=$?
    rm -f "$filename"
    exit $result
}

help(){
    echo 'Specify the file path to the *.py/*.R/*.sql file.'
}

if [ $# != 1 ]; then
    help
    exit 1
fi

cd "$(dirname $0)"
case "$1" in
  *.py ) run_python "$1" ;;
  *.sql ) run_sql "$1" ;;
  *.R ) run_R "$1" ;;
  * ) help;exit 1 ;;
esac