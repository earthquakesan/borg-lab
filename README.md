# borg-lab
Trying out borg backup software.

## Quick Start

Install vagrant and vbguest extension:

```
vagrant plugin install vagrant-vbguest
```

To have a running two-node setup execute the following commands:

```
vagrant up
make install
```

By default a cronjob is installed on client machine, which performs backups every minute (* * * * *).

## Backup

The backup configuration is located in /etc/borgmatic/config.yaml
To perform backup simply run:

```
make ssh-client
borgmatic
```

## Restore

```
make ssh-client
borgmatic list
borgmatic list --archive client-2019-11-12T05:51:06.582587
borgmatic extract --archive client-2019-11-12T05:51:06.582587 --restore-path var/log/syslog
```

Every client has access only to its' own repository. The repository key is stored in credentials/ directory after initialization (generated on provision).

## Access Backups from the backup machine

Look up the password in the credentials/ directory.

```
make ssh-server
export BORG_REPO="/data/borg/app.eccenca.local/"
export BORG_PASSPHRASE='h9haM_1l0g_if.ysWu8:XWqPvaCyu-fvAWHCyGsvoY,64iIAHn'
borg list
```

## Misc Tasks

### Updating playbooks/roles/borg/files/borg.public.key

For the key signature check the README.txt in the specific release: https://github.com/borgbackup/borg/releases

```
gpg --keyserver hkp://keys.gnupg.net:80 --recv-keys "6D5B EF9A DD20 7580 5747 B70F 9F88 FB52 FAF7 B393"
gpg --list-keys
gpg --export 6D5BEF9ADD2075805747B70F9F88FB52FAF7B393 > borg.public.key
```