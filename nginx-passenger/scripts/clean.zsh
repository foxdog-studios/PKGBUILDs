#!/usr/bin/env zsh

setopt ERR_EXIT
setopt NO_UNSET

readonly repo=$(realpath "$(dirname "$(realpath -- $0)")/..")

rm --force --recursive                        \
    PKGBUILD                                  \
    cleanup-headers.patch                     \
    logrotate                                 \
    nginx-1.6.0.tar.gz                        \
    nginx-passenger                           \
    nginx-passenger-1.6.0-5-x86_64.pkg.tar.xz \
    pkg                                       \
    release-4.0.46.tar.gz                     \
    service                                   \
    src

