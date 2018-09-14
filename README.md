# awesomebook

このリポジトリは、[本家](https://github.com/ghmagazine/awesomebook)のサンプルコードをDockerにより実行しやすくしたものです。  
本家ではデータベースにAmazon Redshiftを用いていますが、こちらではPostgreSQLを用いています。  
細かな仕様の違いがあるため、書籍とは挙動が異なる可能性がありますのでご注意ください。

## 『前処理大全』のサンプルコード

本橋智光　著、株式会社ホクソエム　監修  
B5変／366ページ／本体価格3,000円＋税  
ISBN978-4-7741-9647-3  
技術評論社、2018年発行  

## サンプルコードの実行

Python/R/SQLのスクリプトを実行する手順を説明します。

### 1. 各サービスの起動

データベースにPostgreSQLを、Python/Rの実行環境としてJupyterを用いています。  
また、データベース管理にAdminerも入れています。

```console
$ git clone https://github.com/uphy/awesomebook
$ cd awesomebook/docker
$ docker-compose up -d
```

特にJupyterのイメージが大きく(6 GB)、取得に時間がかかります。

### 2. PostgreSQLへのサンプルデータ登録

念の為PostgreSQLの起動を確認します。

```console
$ cd docker
$ docker-compose logs --tail 5 postgres
Attaching to awesomebook_postgres_1
postgres_1  |
postgres_1  | LOG:  database system was shut down at 2018-09-14 23:30:45 UTC
postgres_1  | LOG:  MultiXact member wraparound protections are now enabled
postgres_1  | LOG:  database system is ready to accept connections
postgres_1  | LOG:  autovacuum launcher started
```

上記のように表示され起動が確認できたら、以下のコマンドでサンプルデータを登録できます。

```console
$ ./load_data.sh
CREATE SCHEMA
CREATE TABLE
COPY 1000
CREATE TABLE
COPY 1186
CREATE TABLE
COPY 300
CREATE TABLE
COPY 49
CREATE TABLE
COPY 1000
CREATE TABLE
COPY 1000
CREATE TABLE
COPY 4030
```

### 3. 各種スクリプトの実行

Python/R/SQLのスクリプトを、`run.sh`で実行できます。

例)

```console
$ ./run.sh preprocess/002_selection/02/a_sql_2_awesome.sql
 reserve_id | hotel_id | customer_id |  reserve_datetime   | checkin_date | checkin_time | checkout_date | people_num | total_price
------------+----------+-------------+---------------------+--------------+--------------+---------------+------------+-------------
 r285       | h_121    | c_67        | 2016-09-27 06:13:19 | 2016-10-12   | 12:00:00     | 2016-10-14    |          4 |      184000
 r1933      | h_113    | c_477       | 2016-09-24 09:04:26 | 2016-10-12   | 11:30:00     | 2016-10-13    |          4 |       77200
 r2291      | h_230    | c_574       | 2016-10-09 04:34:14 | 2016-10-12   | 12:00:00     | 2016-10-13    |          1 |       17400
 r2524      | h_203    | c_631       | 2016-09-14 10:45:15 | 2016-10-12   | 10:30:00     | 2016-10-14    |          3 |      167400
 r3147      | h_163    | c_794       | 2016-10-02 07:35:16 | 2016-10-13   | 09:00:00     | 2016-10-16    |          1 |       64200
 r3328      | h_23     | c_833       | 2016-09-28 08:22:57 | 2016-10-13   | 09:00:00     | 2016-10-14    |          4 |      260400
 r3381      | h_110    | c_844       | 2016-09-17 17:44:02 | 2016-10-13   | 12:30:00     | 2016-10-15    |          1 |       52800
 r3444      | h_14     | c_859       | 2016-10-03 17:26:00 | 2016-10-13   | 12:30:00     | 2016-10-15    |          3 |       46200
(8 rows)
```

### 4. 後片付け

作成したコンテナ、イメージ、作業データ等を削除します。

```console
$ cd docker
$ docker-compose down --rmi all
$ rm -rf data
```

## Tips

### Adminerへのログイン

http://localhost:8000/ を開き、以下の設定でログインしてください。

|項目|設定値|
|--------|--------------|
| Server | postgres |
| User | postgres |
| Password | postgres |
| Database | work |

### Jupyter Notebookへのログイン

以下のコマンドでログインのためのトークンを確認してください。

```console
$ docker-compose logs jupyter | grep token= | head -n1 | sed -e "s/.*token=\(.*\)/\1/"
```

http://localhost:8888/ を開き、確認したトークンを入力し、ログインしてください。

## 目次

- はじめに
- Part1 入門前処理
- 第1章 前処理とは
- Part2 データ構造を対象とした前処理
- 第2章 抽出
- 第3章 集約
- 第4章 結合
- 第5章 分割
- 第6章 生成
- 第7章 展開
- 第8章 数値型
- 第9章 カテゴリ型
- 第10章 日時型
- 第11章 文字型
- 第12章 位置情報型
- Part4 実践前処理
- 第13章 演習問題

## サポートページ

http://gihyo.jp/book/2018/978-4-7741-9647-3

## ライセンス

https://github.com/ghmagazine/awesomebook/blob/master/LICENSE
