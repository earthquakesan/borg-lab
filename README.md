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
