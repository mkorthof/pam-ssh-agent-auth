#!/bin/sh
make distclean && \
./configure --libexecdir=/lib/security --with-mantype=man && \
echo "PAM module providing authentication via ssh-agent" > description-pak
echo | sudo checkinstall --maintainer=soupboy@sourceforge.net --pkglicense=BSD \
  --pkgsource https://github.com/jbeverly/pam_ssh_agent_auth \
  --pkgaltsource https://sourceforge.net/projects/pamsshagentauth/files/pam_ssh_agent_auth
