#!/bin/bash

set -e

# Build the Docker image if not present
if [[ "$(docker images -q geant4:11.2.1 2> /dev/null)" == "" ]]; then
  echo "Building Geant4 Docker image..."
  docker build -t geant4:11.2.1 .
fi

# Run Geant4 container with host X11 access
docker run -it \
  --env DISPLAY=$DISPLAY \
  --env QT_X11_NO_MITSHM=1 \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  --volume geant4data:/home/geant4user \
  geant4:11.2.1 \
  bash -c '
    cd /home/geant4user
    if [ ! -d geant4-v11.2.1 ]; then
      wget https://gitlab.cern.ch/geant4/geant4/-/archive/v11.2.1/geant4-v11.2.1.tar.gz
      tar -xzf geant4-v11.2.1.tar.gz
    fi

    cd geant4-v11.2.1/examples/basic/B1
    mkdir -p build && cd build
    cmake .. && make -j$(nproc)
    ./exampleB1
  '
