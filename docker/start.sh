#!/bin/bash
cd "$(dirname "$0")"
cd ..

workspace_dir=$PWD

if ["$(docker ps -aq -f status=exited -f name=droidslam)" ]; then
    docker rm droidslam
fi

XAUTH=/tmp/.docker.xauth
 
echo "Preparing Xauthority data..."
xauth_list=$(xauth nlist :0 | tail -n 1 | sed -e 's/^..../ffff/')
if [ ! -f $XAUTH ]; then
    if [ ! -z "$xauth_list" ]; then
        echo $xauth_list | xauth -f $XAUTH nmerge -
    else
        touch $XAUTH
    fi
chmod a+r $XAUTH
fi

echo "Done."
echo ""
echo "Verifying file contents:"
file $XAUTH
echo "--> It should say \"X11 Xauthority data\"."
echo ""
echo "Permissions:"
ls -FAlh $XAUTH
echo ""
echo "Running docker..."

docker run -it -d --rm \
    -e "DISPLAY" \
    -e "QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --net=host \
    --privileged \
    --runtime=nvidia \
    --gpus=all \
    --shm-size="35g" \
    --name droidslam \
    -v $workspace_dir/:/home/trainer/droidslam:rw \
    -v /home/user/Datasets/:/home/trainer/Datasets/:rw \
    x64/droidslam:latest

    # \ '"device=0"'

