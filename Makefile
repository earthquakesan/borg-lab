
inventory := inventory/hosts
pb_run := ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${inventory} playbooks
add-ssh-key:
	ssh-add ~/.vagrant.d/insecure_private_key

provision: add-ssh-key
	 ${pb_run}/provision.yml

install-restic: add-ssh-key
	${pb_run}/borg.yml

install: provision install-restic

ssh-server: add-ssh-key
	ssh vagrant@10.10.0.2

ssh-client: add-ssh-key
	ssh vagrant@10.10.0.3