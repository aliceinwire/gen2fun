#!/usr/bin/env bash

pushd /usr
wget http://ftp.osuosl.org/pub/funtoo/funtoo-current/snapshots/portage-current.tar.xz
mv /usr/portage /usr/portage_gentoo
tar xvJf portage-current.tar.xz
popd

pushd /usr/portage
git checkout funtoo.org
emerge portage
emerge portage -pv 2> /tmp/digests
for ebuild in `awk '{print $6}' /tmp/digests | tr -d \'`;do ebuild $ebuild digest;done
echo "check_certificate=off >> /etc/wgetrc"
emerge portage
git checkout -f
emerge --sync
dispatch-conf

