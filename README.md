# pam-ssh-agent-auth
#### Debian packages for pam_ssh_agent_auth

PAM module providing authentication via ssh-agent
https://github.com/jbeverly/pam_ssh_agent_auth
https://sourceforge.net/projects/pamsshagentauth/files/pam_ssh_agent_auth

## In case the steps below are too much trouble for you (and you trust me... ;) just execute the oneliner below to install the package.

pam_ssh_agent_auth-0.10.3 (pam-ssh-agent-auth_0.10.3-1_amd64.deb):
<pre>
$ wget https://github.com/mkorthof/pam-ssh-agent-auth/raw/master/pam-ssh-agent-auth_0.10.3-1_amd64.deb && sha512sum pam-ssh-agent-auth_0.10.3-1_amd64.deb | \
grep 67f4b87f5ac840deb0c6d38c7812221dbf6d74fb14252100a3fc67d76645ae4b79599bc8dee440c91b910c4d1e612fe988e5c151e8b4830c1b5058fbc87c8043 && \
dpkg -i sha512sum pam-ssh-agent-auth_0.10.3-1_amd64.deb
</pre>
<sub>(copy/paste as one line)</sub>
<br><br>

## To create the package youself:
<pre>
$ git clone or download from SF
$ cd pam_ssh_agent_auth-x.x.x
$ make distclean && \
./configure --libexecdir=/lib/security --with-mantype=man && \
echo "PAM module providing authentication via ssh-agent" > description-pak
echo | sudo checkinstall --maintainer=soupboy@sourceforge.net --pkglicense=BSD \
  --pkgsource https://github.com/jbeverly/pam_ssh_agent_auth \
  --pkgaltsource https://sourceforge.net/projects/pamsshagentauth/files/pam_ssh_agent_auth
</pre>