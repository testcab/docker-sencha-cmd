FROM openjdk:8-jre
LABEL maintainer="test.cab <git@test.cab>"
ARG CMD_VERSION=7.3.0.19

# https://docs.sencha.com/cmd/7.3.0/guides/getting_started_cmd.html#getting_started_cmd_-_dependencies
RUN apt-get update \
 && apt-get upgrade -y \
 # Fashion extension dependencies
 && apt-get install -y nodejs npm \
 # Compass extension dependencies
 && apt-get install -y ruby

RUN wget "http://cdn.sencha.com/cmd/$CMD_VERSION/no-jre/SenchaCmd-$CMD_VERSION-linux-amd64.sh.zip" \
 && unzip SenchaCmd-$CMD_VERSION-linux-amd64.sh.zip \
 && rm    SenchaCmd-$CMD_VERSION-linux-amd64.sh.zip \
 &&     ./SenchaCmd-$CMD_VERSION-linux-amd64.sh -q -Dall=true -V'addToPath$Integer=1' -dir /opt/Sencha/Cmd/$CMD_VERSION \
 && rm    SenchaCmd-$CMD_VERSION-linux-amd64.sh

ENV PATH="/opt/Sencha/Cmd:$PATH"
ENTRYPOINT [ "/opt/Sencha/Cmd/sencha" ]
