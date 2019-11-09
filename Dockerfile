FROM openjdk:8-jdk-slim-buster

LABEL maintainer="Typositoire"

ARG PACK_URL=https://media.forgecdn.net/files/2778/975/FTBRevelationServer_3.2.0.zip

ENV EULA=false \
    FTB_HOME=/opt/Revelation

VOLUME [ "${FTB_HOME}/world" ]

ADD  ${PACK_URL} /ftbbin/pack.zip

RUN apt-get update && \
    apt-get install -y unzip curl && \
    unzip /ftbbin/pack.zip -d $FTB_HOME && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x ${FTB_HOME}/ServerStart.sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]