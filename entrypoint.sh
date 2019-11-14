#!/bin/bash
trap : TERM INT
mkdir "$ADA_IMPORT_DIR"
chown --recursive ada:ada "$ADA_IMPORT_DIR"
sudo --set-home --user ada bash --comand "/bin/bash /home/ada/ada-web/bin/runme"
tail --follow /dev/null & wait
