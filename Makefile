
inventory := inventory/hosts
pb_run := ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${inventory} playbooks
add-ssh-key:
	ssh-add ~/.vagrant.d/insecure_private_key

provision: add-ssh-key
	cp playbooks/provision/* /tmp/
	${pb_run}/provision.yml

install-borg: add-ssh-key
	${pb_run}/borg.yml

install-borgmatic: add-ssh-key
	${pb_run}/borgmatic.yml

install-borg-repo: add-ssh-key
	${pb_run}/borg_init.yml

install: provision install-borg install-borgmatic install-borg-repo

ssh-server: add-ssh-key
	ssh vagrant@10.10.0.2

ssh-client: add-ssh-key
	ssh vagrant@10.10.0.3

ssh-app: add-ssh-key
	ssh vagrant@10.10.0.4

ssh-web: add-ssh-key
	ssh vagrant@10.10.0.5