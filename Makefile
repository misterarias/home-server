.PHONY: verify
verify:
	@ansible all --list-hosts --inventory=inventory.yml
	@ansible all -m raw -a uptime --inventory=inventory.yml

.PHONY: verify-python
verify-python:
	@ansible all --list-hosts --inventory=inventory.yml
	@ansible all -m ping --inventory=inventory.yml

.PHONY: install
install:
	@ansible-playbook --inventory=inventory.yml ./homeserver.yml

