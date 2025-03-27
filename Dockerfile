MAINTAINER "Lingmo OS Team"
FROM debian:trixie-slim
RUN apt-get update && \
    apt-get upgrade && \
    apt-get install --no-install-recommends -y live-build
VOLUME ["/work"]
WORKDIR /work
CMD sh -c "lb config && lb build"
