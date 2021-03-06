# DO NOT MODIFY THIS FILE MANUALLY TO CONFIGURE YOUR ADA DEPLOYMENT
# ALL CONFIGURATION HAPPENS VIA ENVIRONMENT VARIABLES
# READ THE README!

FROM openjdk:8
ENV ADA_VERSION=0.8.1
RUN groupadd --system ada && useradd --no-log-init --create-home --shell /bin/bash --gid ada ada
WORKDIR /home/ada/
RUN apt-get update \
    && apt-get install -y sudo less vim \
    && wget https://webdav-r3lab.uni.lu/public/ada-artifacts/ada-web-$ADA_VERSION.zip \
    && unzip ada-web-$ADA_VERSION.zip \
    && mv ada-web-$ADA_VERSION/ ada-web/ \
    && chown --recursive ada:ada ada-web/ \
    && rm ada-web-$ADA_VERSION.zip \
    && mkdir /home/ada/datasetimport/ \
    && chown --recursive ada:ada /home/ada/datasetimport/
COPY entrypoint.sh .
ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
