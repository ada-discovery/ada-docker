FROM openjdk:8
ENV ADA_VERSION=0.8.0
RUN wget https://webdav-r3lab.uni.lu/public/ada-artifacts/ada-web-$ADA_VERSION.zip \
    && unzip ada-web-$ADA_VERSION.zip \
    && rm -rf ada-web-$ADA_VERSION.zip
WORKDIR /ada-web-$ADA_VERSION/bin/
ENTRYPOINT bash runme; tail -f /dev/null