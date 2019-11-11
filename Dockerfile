FROM openjdk:8
ENV ADA_VERSION=0.8.0
RUN wget https://webdav-r3lab.uni.lu/public/ada-artifacts/ada-web-$ADA_VERSION.zip -O ada.zip \
    && unzip ada.zip \
    && rm -rf ada.zip
WORKDIR ada/
ENTRYPOINT bash bin/runme; tail -f /dev/null