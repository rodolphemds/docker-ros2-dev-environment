#!/bin/bash

# Exit immediately on failure.
set -e

# Derive local workspace's absolute path from script's path.
LOCAL_WORKDIR=$(cd $(dirname $(dirname "${BASH_SOURCE[0]}")) >/dev/null 2>&1 && pwd)

main() {
  # Variables.
  local image_tag=ros:humble-ros-core
  local local_workdir=$LOCAL_WORKDIR
  local local_port=8765

  local container_name=ros2-devcontainer
  local container_workdir=/ros2_ws
  local container_port=8765

  # Build image (if necessary).
  docker build --rm -t $image_tag $local_workdir

  # Start container.
  docker run --rm -it \
    --name $container_name \
    --volume $local_workdir:$container_workdir \
    --workdir $container_workdir \
    --publish $local_port:$container_port \
    $image_tag
}

main
