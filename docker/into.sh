#!/bin/bash
docker exec -it droidslam\
    /bin/bash -c "
    cd /home/trainer/droidslam;
    python3 setup.py install;
    nvidia-smi;
    /bin/bash"