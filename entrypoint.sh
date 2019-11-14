#!/bin/bash
trap : TERM INT
mkdir "$ADA_IMPORT_DIR"
chown --recursive ada:ada "$ADA_IMPORT_DIR"
sudo --set-home --user ada bash --comand "/bin/bash /home/ada/ada-web/bin/runme"
# the tail to /dev/null prevents the container from exiting prematurely
# because runme always runs detached (needs to be an option)
tail --follow /dev/null & wait
