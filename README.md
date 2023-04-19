# ROS2 Container
This is a collection of scripts that allow to run ros2 in a container.
X11 and grafics drivers are passed from the host system into the container to allow graphical applications to run

## ``Containerfile``
Containerfile for the ros2 container

## ``build.sh``
Build the Containerfile using podman and tag it `ros2-humble`

## ``run.sh``
Creates a new container instance of the Image created with ``build.sh`` and opens a terminal to the new container.
The container will persist in shutdown state when the terminal is closed.

## ``ros2``
Starts and attaches to an existing container that might have been created with ``run.sh`` previously

## Config Files
 - ``sysinit.vim`` container wide basic neovim config
 - ``.bashrc`` almost default bashrc that sources ros/rumble setup.bash
 - ``doas.conf`` doas config (currently unused)

