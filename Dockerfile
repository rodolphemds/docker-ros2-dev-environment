FROM ros:humble-ros-core

# Define the working directory.
WORKDIR /ros2_ws

# Install the necessary ROS2 packages.
RUN apt-get update && apt-get -y install -y \
ros-jazzy-demo-nodes-cpp \
ros-jazzy-foxglove-bridge \
ros-jazzy-tf2-ros

# Mount the root project directory where this Dockerfile is stored as a volume in the container.
VOLUME /ros2_ws

# Clean up.
RUN apt-get autoremove -y && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# To be able to connect Foxglove to the container, you have to publish the port 8765
EXPOSE 8765

# Start a bash shell.
CMD ["bash"]

# Note this Dockerfile needs the root project directory to be mounted as a volume in the container.