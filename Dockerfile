FROM openjdk:8
ENV ADA_VERSION=0.8.0
RUN groupadd --system ada && useradd --no-log-init --create-home --shell /bin/bash --gid ada ada
WORKDIR /home/ada/
RUN wget https://webdav-r3lab.uni.lu/public/ada-artifacts/ada-web-$ADA_VERSION.zip \
    && unzip ada-web-$ADA_VERSION.zip \
    && mv ada-web-$ADA_VERSION/ ada-web/ \
    && chown --recursive ada:ada ada-web/ \
    && rm ada-web-$ADA_VERSION.zip
USER ada
# the tail to /dev/null prevents the container from exiting prematurely
# because runme always runs detached (needs to be an option)
ENTRYPOINT bash ada-web/bin/runme; tail --follow /dev/null