# cmake_playing

docker build . -t cmake_playing
# docker build . --platform linux/arm64 -t cmake_playing
# docker build . --platform linux/amd64 -t cmake_playing
docker run -d -v .:/home/tuna/data cmake_playing sleep infinity
docker exec -it b9e83606fc5e /bin/bash

#https://hub.docker.com/r/kitware/cmake
#
#```bash
#docker pull kitware/cmake
#docker pull kitware/cmake:ci-debian12-x86_64-2025-01-23
#docker pull kitware/cmake:ci-debian12-aarch64-2025-02-24
#```
