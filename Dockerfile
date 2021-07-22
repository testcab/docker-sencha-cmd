FROM openjdk:8-jre
LABEL maintainer="test.cab <git@test.cab>"

# https://docs.sencha.com/cmd/7.4.0/guides/getting_started_cmd.html#getting_started_cmd_-_dependencies
RUN apt-get update \
 && apt-get upgrade -y \
 # Fashion extension dependencies
 && apt-get install -y nodejs npm \
 # Compass extension dependencies
 && apt-get install -y ruby

ARG CMD_VERSION=7.4.0.39
RUN wget "http://cdn.sencha.com/cmd/$CMD_VERSION/no-jre/SenchaCmd-$CMD_VERSION-linux-amd64.sh.zip" \
 && unzip SenchaCmd-$CMD_VERSION-linux-amd64.sh.zip \
 && rm    SenchaCmd-$CMD_VERSION-linux-amd64.sh.zip \
 &&     ./SenchaCmd-$CMD_VERSION-linux-amd64.sh -q -Dall=true -V'addToPath$Integer=1' -dir /opt/Sencha/Cmd/$CMD_VERSION \
 && rm    SenchaCmd-$CMD_VERSION-linux-amd64.sh \
 # Make sencha runnable with non-root user
 && mkdir /opt/Sencha/Cmd/repo \
 && chmod 777 /opt/Sencha/Cmd/repo \
 # Fix generated directory '?' when running sencha
 && echo -Duser.home=/tmp >> /opt/Sencha/Cmd/$CMD_VERSION/sencha.vmoptions

# Fix PhantomJS SSL error
# https://github.com/DMOJ/online-judge/pull/1270
# https://github.com/wch/webshot/pull/93#issuecomment-603413554
ENV OPENSSL_CONF=/etc/ssl

ENV PATH="/opt/Sencha/Cmd:$PATH"
ENTRYPOINT [ "/opt/Sencha/Cmd/sencha" ]
