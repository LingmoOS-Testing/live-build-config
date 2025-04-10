FROM debian:trixie-slim
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y live-build expect
VOLUME ["/work"]
WORKDIR /work
CMD sh -c "([ -f cache.tar ] && tar -xf cache.tar) ; \
    lb config && \
    unbuffer lb build && \
    tar -cf cache.tar cache"
