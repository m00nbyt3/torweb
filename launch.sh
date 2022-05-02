MACHINE=$(docker ps -a | grep -o torweb)
IMAGE=$(docker images | grep -o torweb)

if [ "$1" = "--build" ]; then
    if [ "$MACHINE" ]; then
        docker rm tormachine
    fi
    docker build -t torweb .
    docker run -dit -p 80:80 --name tormachine torweb
elif [ "$MACHINE" ]; then
    docker start -a -i tormachine
elif [ "$IMAGE" ]; then
    docker run -dit -p 80:80 --name tormachine torweb
else
    docker build -t torweb .
    docker run -dit -p 80:80 --name tormachine torweb
fi
