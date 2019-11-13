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

Every client has access only to its' own repository. 
The repository key is stored in credentials/ directory after initialization (generated on provision).
One repository per client (host) is required, as client acquires a lock on a repository during the sync (i.e. parallel sync of multiple clients to one repo is not possible).

## Access Backups from the backup machine

Look up the password in the credentials/ directory.

```
make ssh-server
export BORG_REPO="/data/borg/app.eccenca.local/"
export BORG_PASSPHRASE='h9haM_1l0g_if.ysWu8:XWqPvaCyu-fvAWHCyGsvoY,64iIAHn'
borg list
```

## Notifications

On failure borgmatic will execute scripts located in /root/bin/pagerduty-notification.sh.
The script will trigger an incident in PagerDuty.
To work properly, it requires a routing key from a service in PagerDuty.
To setup the routing key, create the following file and edit it afterwards:

```
cp playbooks/secrets.yml.example playbooks/secrets.yml
```

## Misc Tasks

### Updating playbooks/roles/borg/files/borg.public.key

For the key signature check the README.txt in the specific release: https://github.com/borgbackup/borg/releases

```
gpg --keyserver hkp://keys.gnupg.net:80 --recv-keys "6D5B EF9A DD20 7580 5747 B70F 9F88 FB52 FAF7 B393"
gpg --list-keys
gpg --export 6D5BEF9ADD2075805747B70F9F88FB52FAF7B393 > borg.public.key
```
