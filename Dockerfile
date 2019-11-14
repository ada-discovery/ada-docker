FROM openjdk:8
ENV ADA_VERSION=0.8.0
ENV ADA_IMPORT_DIR=/home/ada/datasetimport
RUN groupadd --system ada && useradd --no-log-init --create-home --shell /bin/bash --gid ada ada
WORKDIR /home/ada/
COPY entrypoint.sh .
RUN wget https://webdav-r3lab.uni.lu/public/ada-artifacts/ada-web-$ADA_VERSION.zip \
    && unzip ada-web-$ADA_VERSION.zip \
    && mv ada-web-$ADA_VERSION/ ada-web/ \
    && chown --recursive ada:ada ada-web/ \
    && rm ada-web-$ADA_VERSION.zip
ENTRYPOINT ["/bin/bash", "entrypoint.sh"]