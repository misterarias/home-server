.PHONY: verify
verify:
	@ansible all --list-hosts --inventory=inventory.ini
