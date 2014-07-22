dockerfiles-rhel-MariaDB
========================

Tested on Docker 0.10.0-dev

This repo contains a recipe for making Docker container for MariaDB on Red Hat Enterprise Linux. 

Check your Docker version

    # docker version

Perform the build

    # docker build -rm -t <yourname>/mariadb .

Check the image out.

    # docker images

Run it:

    # docker run -d -p 3306:3306 <yourname>/mariadb

Get container ID:

    # docker ps

Keep in mind the password set for MariaDB is: mariadbPassword

Get the IP address for the container:

    # docker inspect --format "{{ .NetworkSettings.IPAddress }}" <container_id>

For MySQL:

    # mysql -h 172.17.0.x -utestdb -pmariadbPassword

Create a table:

```
\> show databases;

\> use test;

\> CREATE TABLE test (name VARCHAR(10), owner VARCHAR(10),
    -> species VARCHAR(10), birth DATE, death DATE);

\> show tables;
```
