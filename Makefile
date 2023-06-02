PREFIX ?= /usr/local/bin
SCRIPT = ldv

install:
	@echo "Installing script to $(PREFIX)"
	@ln -s -f $(realpath $(SCRIPT)) $(PREFIX)/$(SCRIPT)
	@chmod +x $(PREFIX)/$(SCRIPT)
	@echo "Script installed successfully."

uninstall:
	@echo "Removing script from $(PREFIX)"
	@rm -f $(PREFIX)/$(SCRIPT)
	@echo "Script uninstalled successfully."

