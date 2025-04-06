#! /bin/sh

LD_LIBRARY_PATH=/usr/lib/$(uname -m)-linux-gnu:. QT_QPA_PLATFORM=xcb QT_PLUGIN_PATH=. exec ./yuzu "$@"
