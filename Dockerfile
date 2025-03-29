FROM debian:trixie-slim
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
        live-build dctrl-tools dosfstools mtools \
        xorriso mokutil librsvg2-2 isolinux \
        squashfs-tools shim-signed librsvg2-bin && \
    apt-get install --no-install-recommends -y \
        $(case $(uname -m) in \
            x86_64) echo grub-pc-bin grub-efi-amd64-bin \
                    grub-efi-ia32-bin grub-efi-amd64-signed \
                    shim-helpers-amd64-signed memtest86+;; \
            aarch64) echo grub-efi-arm64-bin grub-efi-arm64-signed \
                    shim-helpers-arm64-signed;; \
        esac)
VOLUME ["/work"]
WORKDIR /work
CMD sh -c "([ -f cache.tar ] && tar -xf cache.tar) ; \
    lb config && \
    lb build && \
    tar -cf cache.tar cache"
