if ! [ -f ./config/database.yml ]; then
  cp docker/config/database.yml ./config/database.yml
fi

# build image default
docker build -t "internship-loans:1.0" --network=host -f docker/Dockerfile .
docker build -t "internship-loans-db:1.0" --network=host -f docker/Dockerfile_db .

# build any other images
docker-compose build