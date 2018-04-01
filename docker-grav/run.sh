# stop and remove earlier containers, if any
docker stop containerName
docker rm containerName

# run new container in detached mode
# mounting the html folder
docker run \
        --name containerName \
        --mount type=bind,source="$(pwd)/html",target=/var/www/html \
        -p 80:80 \
        -d \
        buildName;
