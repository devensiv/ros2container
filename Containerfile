from ubuntu:latest

# Copy needed files
COPY sysinit.vim /usr/share/nvim/sysinit.vim
# COPY doas.conf /etc/doas.conf
COPY .bashrc /root/.bashrc

# Update system and install software
RUN apt-get update -y && apt-get install -y neovim locales curl # doas

# Setup locale
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8

# Universe repo
RUN apt-get install -y software-properties-common
RUN add-apt-repository universe -y

# Ros repo
ARG DEBIAN_FRONTEND=noninteractive
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN apt-get update -y

# install ros
RUN apt-get install -y ros-humble-desktop ros-humble-gazebo-* ros-humble-cartographer-ros ros-humble-nav2-bringup ros-humble-dynamixel-sdk ros-humble-turtlebot3-msgs ros-humble-turtlebot3 ros-humble-turtlebot3-gazebo

# install rust
RUN apt-get install -y cargo

