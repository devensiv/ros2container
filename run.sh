mkdir workdir -p

if [ -z "$1" ]; then
	name="ros2-default"
else
	name="$1"
fi

podman run -it -v ./workdir:/root/workdir -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/dri/card0:/dev/dri/card0 -v ~/.Xauthority:/tmp/.Xauthority -e XAUTHORITY=/tmp/.Xauthority --net=host --name="$name" -e DISPLAY ros2-humble bash
