# pam-ssh-agent-auth

## Debian packages for pam_ssh_agent_auth

### PAM module providing authentication via ssh-agent

* https://github.com/jbeverly/pam_ssh_agent_auth
* https://sourceforge.net/projects/pamsshagentauth/files/pam_ssh_agent_auth

## Installation

In case the pkg create/install steps below are too much trouble for you (and you trust me... ;) just execute the oneliner below to install the package:

* [2019-08-28] **pam-ssh-agent-auth_0.10.3-7ff7858** (openssl-1.1)

```bash
$ wget https://github.com/mkorthof/pam-ssh-agent-auth/raw/master/pam-ssh-agent-auth_0.10.3-7ff7858-1_amd64.deb && \
sha512sum pam-ssh-agent-auth_0.10.3-7ff7858-1_amd64.deb | \
grep 1bc4c5773ed0894c3daaaa89258d3bdab65c200171c8cb132cccf28e4787084385540687754991c5b53c2191ae77a0ceb601ce26f7f7a748b5adbeb741bb9e8e && \
dpkg -i pam-ssh-agent-auth_0.10.3-7ff7858-1_amd64.deb
```

---

* [2016-11-25] **pam-ssh-agent-auth_0.10.3**

```bash
$ wget https://github.com/mkorthof/pam-ssh-agent-auth/releases/download/0.10.3/pam-ssh-agent-auth_0.10.3-1_amd64.deb && \
sha512sum pam-ssh-agent-auth_0.10.3-1_amd64.deb | \
grep 67f4b87f5ac840deb0c6d38c7812221dbf6d74fb14252100a3fc67d76645ae4b79599bc8dee440c91b910c4d1e612fe988e5c151e8b4830c1b5058fbc87c8043 && \
dpkg -i pam-ssh-agent-auth_0.10.3-1_amd64.deb
```

> (copy/paste as one line)

## Configuration

First make sure you have a 2nd shell open as root in case of trouble.

Add the following line to /etc/sudoers using `visudo`:

```
  Defaults        env_keep += "SSH_AUTH_SOCK"
```

And add this line to top of /etc/pam.d/sudo, under `"#%PAM-1.0"`:

```
  auth [success=2 default=ignore] pam_ssh_agent_auth.so file=/home/&lt;username&gt;/.ssh/authorized_keys allow_user_owned_authorized_keys_file authorized_keys_user=&lt;username&gt;
```

> (replacing \<username> with your own)

Or use `man pam_ssh_agent_auth` for more options.

## Create/install the Debian package yourself

1. Get the original source

```bash
$ https://github.com/jbeverly/pam_ssh_agent_auth.git
$ cd pam_ssh_agent_auth-x.x.x
```

2. **For openssl-1.1**: replace [configure.ac](configure.ac) from this repo

3. Run [pam_ssh_agent_auth-install.sh](pam_ssh_agent_auth-install.sh)
