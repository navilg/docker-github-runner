FROM debian:stable-slim
ARG user=runner
ARG group=runner
ARG uid=1000
ARG gid=1000
ARG DEBIAN_FRONTEND="noninteractive"
RUN apt update && apt install bash curl libdigest-sha-perl tar -y && \
    addgroup --gid ${gid} ${group} && useradd -m -d /runner --uid ${uid} --gid ${gid} --shell /bin/bash ${user} && \
    mkdir /runner/actions-runner && \
    curl -LO https://download.docker.com/linux/static/stable/x86_64/docker-20.10.9.tgz && \
    tar xzvf docker-20.10.9.tgz && \
    cp docker/* /usr/bin/ && \
    rm -rfv docker-20.10.9.tgz docker

COPY ./container-entrypoint.sh /runner/container-entrypoint.sh
WORKDIR /runner/actions-runner
RUN curl -o actions-runner-linux-x64-2.294.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.294.0/actions-runner-linux-x64-2.294.0.tar.gz && \
    echo "a19a09f4eda5716e5d48ba86b6b78fc014880c5619b9dba4a059eaf65e131780  actions-runner-linux-x64-2.294.0.tar.gz" | shasum -a 256 -c && \
    tar xvzf ./actions-runner-linux-x64-2.294.0.tar.gz && \
    rm -fv actions-runner-linux-x64-2.294.0.tar.gz && \
    ./bin/installdependencies.sh && \
    chown -R ${uid}:${gid} /runner/actions-runner && \
    rm -rfv \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

USER runner
VOLUME [ "/runner/actions-runner" ]

ENTRYPOINT [ "bash",  "/runner/container-entrypoint.sh" ]