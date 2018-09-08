# Start services

```console
$ git clone https://github.com/uphy/awesomebook
$ cd awesomebook/docker
$ docker-compose up -d
```

# Init PostgreSQL

```console
$ cd docker
$ ./load_data.sh
```

# Login to Adminer

Open http://localhost:8000/

Login with the following DB config

|||
|--------|--------------|
| Server | postgres |
| User | postgres |
| Password | postgres |
| Database | work |

