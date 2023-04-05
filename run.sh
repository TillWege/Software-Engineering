# Vars
DB_USER=user
DB_PASSWORD=password
DB_ROOT_PASSWORD=root_password
DB_NAME=prak-db
DB_ALIAS=prak-db

# Cleanup
docker stop prak_app
docker stop prak_db

docker network rm prak
docker rm prak_app
docker rm prak_db

# Starting Stuff
docker network create prak
docker run -d -p 4200:3000 --name prak_app --network prak \
        -v $PWD/app:/app \
        --network-alias prak_app \
        -e MYSQL_HOST=$DB_ALIAS \
        -e MYSQL_USER=$DB_USER \
        -e MYSQL_PASSWORD=$DB_PASSWORD \
        -e MYSQL_DB=$DB_NAME \
        swe:prak
docker run -d --name prak_db --network prak \
        -e MARIADB_USER=$DB_USER \
        -e MARIADB_PASSWORD=$DB_PASSWORD \
        -e MARIADB_ROOT_PASSWORD=$DB_ROOT_PASSWORD \
        -e MARIADB_DATABASE=$DB_NAME \
        -v $PWD/db:/var/lib/mysql \
        --network-alias $DB_ALIAS \
        mariadb:latest