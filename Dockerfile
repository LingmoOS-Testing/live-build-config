FROM debian:trixie-slim
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y live-build
VOLUME ["/work"]
WORKDIR /work
CMD ([ -f cache.tar ] && tar -xf cache.tar) ; \
    lb config && \
    lb build && \
    tar -cf cache.tar cache"
