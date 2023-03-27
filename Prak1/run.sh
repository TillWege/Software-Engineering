docker stop prak1
docker rm prak1
docker run -d -p 3000:3000 --name prak1 -v $PWD/db:/etc/todos -v $PWD/app:/app swe:prak1 