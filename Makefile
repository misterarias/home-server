.PHONY: verify
verify:
	@ansible all --list-hosts --inventory=inventory.yml
	@ansible all -m raw -a uptime --inventory=inventory.yml

.PHONY: verify-python
verify-python:
	@ansible all --list-hosts --inventory=inventory.yml
	@ansible all -m ping --inventory=inventory.yml

.PHONY: provision
provision:
	@ansible-playbook --inventory=inventory.yml --vault-password-file=.password.txt ./provision.yml 

.PHONY: install
install:
	@ansible-playbook --inventory=inventory.yml ./install.yml

install-amule install-jenkins install-jellyfin install-o11y install-traefik install-home_assistant install-books install-servarr install-pihole install-git:
	@INCLUDE_TASK=$(subst install-,,$@) ansible-playbook --inventory=inventory.yml ./install.yml


