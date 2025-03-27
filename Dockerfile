FROM debian:trixie-slim
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y live-build rsync
VOLUME ["/work","/cache"]
WORKDIR /work
CMD sh -c "mkdir -p /work/cache && \
    rsync -a /cache/ /work/cache/ && \
    lb config && \
    lb build && \
    rsync -a /work/cache/ /cache/"
