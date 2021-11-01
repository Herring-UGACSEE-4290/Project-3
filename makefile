PY = python
PIP = pip

PKG_NAME = csee4290

ENV_DIR = .env
ENV_BIN_DIR = $(ENV_DIR)/bin
EXE = $(ENV_BIN_DIR)/$(PKG_NAME)

GREEN_TEXT = '\033[0;32m'
NC_TEXT = '\033[0m'

# Installs a "flexible" and mutable copy of this package for development
.PHONY: dev_install
dev_install: $(EXE)
	$(PIP) install --editable .

# Fully installs this package
.PHONY: install
install: $(EXE)
	$(PIP) install .

# Removes unnecessary temporary files from the working tree
.PHONY: clean
clean:
	rm -rf build/ dist/ *.egg-info/ $(PKG_NAME)/__pycache__/

# Sets up the virtual environment for development
.PHONY: setup
setup: $(ENV_DIR)

$(ENV_DIR):
	$(PY) -m venv $(ENV_DIR)
	@echo -e $(GREEN_TEXT)Virtual environment is set up. Please run \'. $(ENV_BIN_DIR)/activate\' \
	to activate the virtual environment, then run \'pip install -r requirements.txt\'$(NC_TEXT)

.PHONY: $(EXE)
$(EXE):
	$(PY) -m build
