#!/usr/bin/env zsh

setopt ERR_EXIT
setopt NO_UNSET

readonly base_url=https://aur.archlinux.org/packages/ng/nginx-passenger
readonly tarball_url=$base_url/nginx-passenger.tar.gz

readonly repo=$(realpath "$(dirname "$(realpath -- $0)")/..")

# Install runtime dependencies. Copied from PKGBUILD.
sudo pacman --noconfirm --sync --needed \
    curl                                \
    openssl                             \
    pcre                                \
    ruby                                \
    ruby-rack                           \
    zlib

# Download and extract tarball.
curl $tarball_url           \
    | tar --directory $repo \
          --extract         \
          --gunzip

# Move sources into top-level directory and clean up.
readonly extract=$repo/nginx-passenger
rm $extract/.AURINFO
mv $extract/* .
rmdir $extract

# Update the PKGBUILD.
patch < PKGBUILD.patch

# Build the package.
makepkg

