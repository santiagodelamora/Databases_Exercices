# Contenedores de Sistemas Gestores de Bases de Datos (SGBD)
![Imagen Docker](./img/docker.png)

## Comandos Docker (con descripción)
| Comando | Descripción |
| :--- | :--- |
| **docker --version** | _Verifica la versión de Docker._ |
| **docker pull [nombre_imagen]** | _Descarga una imagen de [DockerHub](https://hub.docker.com/)._ |
| **docker images** | _Visualiza las imágenes._ |
| **docker run** | _Crea un contenedor._ |
| **docker ps** | _Visualiza todos los contenedores en ejecución._ |
| **docker container ls** | _Visualiza todos los contenedores en ejecución._ |
| **docker ps -a** | _Visualiza todos los contenedores en ejecución y no ejecución._ |
| **docker containter ls -a** | _Visualiza todos los contenedores en ejecución y no ejecución._ |
| **docker stop [nombre del contenedor o id]** | _Detiene un contenedor._ |
| **docker start [nombre del  contenedor o id]** | _Inicia un contenedor._ |
| **docker rm [nombre del contenedor o id]** | _Elimina un contenedor que no está en ejecución._ |
| **docker rm -f [nombre del contenedor o id]** | _Elimina un contenedor que está en ejecución._ |
| **docker volume create [nombre del volumen]** | _Crea un volumen._ |

## Comandos de contenedores
```bash
docker pull docker/getting-started
```

## Contenedor de tutorial de Docker
```bash
docker run -d --name tutorial-docker -p 80:80 docker/getting-started:latest
o
docker run -d --name tutorial-docker -p 80:80 d7933
```

## Contenedor de MariaDB sin volumen
```bash
docker run -d --name server-mariadbdsmg3 -p 3342:3306 --env MARIADB_ROOT_PASSWORD=12345 mariadb:lts-ubi9
```

## Contenedor de MariaDB con volumen
```bash
docker run -d --name server-mariadbdsmg3 \
-p 3342:3306 --env MARIADB_ROOT_PASSWORD=12345 \
--volume vol-mariadbdsmg3:/var/lib/mysql \
mariadb:lts-ubi9
```

## Contenedor de Postgres con volumen
```bash
docker run -d --name server-postgresbdsmg3 \
-p 5432:5432 -e POSTGRES_PASSWORD=12345 \
-v vol-postgresdsmg3:/var/lib/postgresql/data \
postgres:14.22-trixie
```

## Contenedor de SQLServer con volumen
```bash
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" \
-u 0 \
-p 1451:1433 --name SQLServerG1 \
-d -v v-sqlserverg1:/var/opt/mssql/data \
d01cc
```