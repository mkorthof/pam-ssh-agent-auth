#!/bin/sh

# NOTE: To workaround incorrect openssl header/library mismatch try:
#       ./configure --without-openssl-header-check"

which checkinstall >/dev/null 2>&1 || { echo "Please install\"checkinstall first."; exit 1; }
make distclean >/dev/null 2>&1
make distclean >/dev/null 2>&1
which autoconf >/dev/null 2>&1 && autoconf || echo "Using existing \"/configure\"..."
./configure --libexecdir=/lib/security --with-mantype=man

cat << EOF >description-pak
PAM module providing authentication via ssh-agent

pam_ssh_agent_auth is a PAM module which permits PAM authentication via your
keyring in a forwarded ssh-agent.
This module can be used to provide authentication for anything run locally that
supports PAM. It was written specifically with the intention of permitting
authentication for sudo without password entry, and also has been proven useful
for use with su as an alternative to wheel.
EOF

VERSION="$(sed -En 's/.*release=v([0-9.]+).*/\1/p' Makefile.in 2>/dev/null|head -1)"
if which git >/dev/null 2>&1; then
  GIT="$(git describe --always)"
  if [ -z "$VERSION" ]; then
    VERSION="$(git log -1 --format='%cd' --date='format:%Y%m%d')"
  fi
  VERSION="${VERSION}-${GIT}"
fi

echo | sudo checkinstall -D \
  --pkgversion="$VERSION" \
  --pkgname="pam_ssh_agent_auth" \
  --maintainer=" Jamie Beverly \<soupboy@sourceforge.net\>" \
  --pkglicense=BSD --pkgsource https://github.com/jbeverly/pam_ssh_agent_auth \
  --pkgaltsource https://sourceforge.net/projects/pamsshagentauth/files/pam_ssh_agent_auth
