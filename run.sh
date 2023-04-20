mkdir workdir -p

if [ -z "$1" ]; then
	name="ros2-default"
else
	name="$1"
fi

podman run -it --rm \
	-v ./workdir:/root/workdir \
	-v "$HOME/.cargo/registry":/usr/local/cargo/registry \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /dev/dri/card0:/dev/dri/card0 \
	-v ~/.Xauthority:/tmp/.Xauthority \
	-e XAUTHORITY=/tmp/.Xauthority \
	-e DISPLAY \
	--net=host \
	--name="$name" \
	-w /root/workdir \
	ros2-humble bash
