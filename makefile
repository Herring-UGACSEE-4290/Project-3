PY = python
PIP = pip

PKG_NAME = csee4290

ENV_DIR = .env
ENV_BIN_DIR = $(ENV_DIR)/bin
PYLIB_EXE = $(ENV_BIN_DIR)/$(PKG_NAME)

INSTALLER = pyinstaller
INSTALLER_ARGS = --onefile -n $(PKG_NAME) $(PKG_NAME)/__init__.py

GREEN_TEXT = '\033[0;32m'
NC_TEXT = '\033[0m'

# Creates an executable from this application
.PHONY: build
build:
	$(INSTALLER) $(INSTALLER_ARGS)

# Packages this application in such a way that it could be uploaded to PyPI
$(PYLIB_EXE):
	$(PY) -m build

# Installs a "flexible" and mutable copy of this package for development
.PHONY: dev_pip_install
dev_install: $(PYLIB_EXE)
	$(PIP) install --editable .

# Fully installs this package
.PHONY: pip_install
install: $(PYLIB_EXE)
	$(PIP) install .

# Removes unnecessary temporary files from the working tree
.PHONY: clean
clean:
	rm -rf build/ dist/ *.egg-info/ $(PKG_NAME)/__pycache__/ *.spec $(PYLIB_EXE)

# Sets up the virtual environment for development
.PHONY: setup
setup: $(ENV_DIR)

$(ENV_DIR):
	$(PY) -m venv $(ENV_DIR)
	@echo -e $(GREEN_TEXT)Virtual environment is set up. Please run \'. $(ENV_BIN_DIR)/activate\' \
	to activate the virtual environment, then run \'pip install -r requirements.txt\'$(NC_TEXT)

