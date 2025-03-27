FROM debian:trixie-slim
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y live-build
VOLUME ["/work","/cache"]
WORKDIR /work
CMD sh -c "mkdir -p /work/cahce && \
    cp -a /cache/. /work/cache && \
    lb config && \
    lb build && \
    cp -a /work/cache/. /cache"
