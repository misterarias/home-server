.PHONY: verify
verify:
	@ansible all --list-hosts --inventory=inventory.ini
	@ansible all -m raw -a uptime --inventory=inventory.ini

.PHONY: verify-python
verify-python:
	@ansible all --list-hosts --inventory=inventory.ini
	@ansible all -m ping --inventory=inventory.ini

.PHONY: install
install:
	@ ansible-playbook  --inventory=inventory.ini playbooks/packages.yml
	@ ansible-playbook  --inventory=inventory.ini playbooks/users.yml

