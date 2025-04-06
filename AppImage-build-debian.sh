#! /bin/bash
set -e

# Get torzu source dir
TORZU_SOURCE_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
echo "Source dir is $TORZU_SOURCE_DIR"
rm -rf "$TORZU_SOURCE_DIR/AppImageBuilder/build"

# Generate debian rootfs
cd /tmp
echo "Cleaning up before build..."
rm -rf torzu-debian-appimage-rootfs rootfs-torzu-appimage-build
debootstrap stable rootfs-torzu-appimage-build http://deb.debian.org/debian/
bwrap --bind rootfs-torzu-appimage-build / \
        --unshare-pid \
        --dev-bind /dev /dev --proc /proc --tmpfs /tmp --ro-bind /sys /sys --dev-bind /run /run \
        --tmpfs /var/tmp \
        --chmod 1777 /tmp \
        --ro-bind /etc/resolv.conf /etc/resolv.conf \
        --ro-bind "$TORZU_SOURCE_DIR" /tmp/torzu-src \
        --chdir / \
        --tmpfs /home \
        --setenv HOME /home \
        --bind /tmp /tmp/hosttmp \
        /tmp/torzu-src/AppImage-build-debian-inner.sh
appimagetool torzu-debian-appimage-rootfs torzu.AppImage
echo "AppImage generated at /tmp/torzu.AppImage! Cleaning up..."
exec rm -rf torzu-debian-appimage-rootfs rootfs-torzu-appimage-build
