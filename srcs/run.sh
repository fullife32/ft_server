docker build ../. -t ok
docker run -p 80:80 ok
docker ps