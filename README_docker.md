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

# Login to Jupyter Notebook

Confirm token for login.

```console
$ docker-compose logs jupyter | grep token= | head -n1 | sed -e "s/.*token=\(.*\)/\1/"
```

Open http://localhost:8888/ and input the token.