mkdir workdir -p

podman run -it -v ./workdir:/root/workdir -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/dri/card0:/dev/dri/card0 -v ~/.Xauthority:/tmp/.Xauthority -e XAUTHORITY=/tmp/.Xauthority --net=host --name=$1 -e DISPLAY ros2-humble bash
