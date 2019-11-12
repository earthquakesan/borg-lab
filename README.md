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

Restore functionality is currently failing:

```
make ssh-client
borgmatic list
borgmatic restore --archive client-datetime-stamp
```
