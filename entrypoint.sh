#!/bin/bash
trap : TERM INT
su --command "/bin/bash /home/ada/ada-web/bin/runme" ada
# the tail to /dev/null prevents the container from exiting prematurely
# because runme always runs detached (needs to be an option)
tail --follow /dev/null & wait
