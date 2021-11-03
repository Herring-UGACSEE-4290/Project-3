# Developer Setup Instructions

## Requirements

### General
- Python version 3.9+

### Windows-Specific
- [Make for Windows](http://gnuwin32.sourceforge.net/packages/make.htm) (Tested)

    or

- [Cygwin](https://www.cygwin.com/) (Not tested, but should work)

## Setup Instructions
These instructions assume that you are using Powershell on Windows, and any bash-like terminal emulator on Linux/MacOS.

1. Clone this repository
``` sh
$ git clone https://github.com/Herring-UGACSEE-4290/Project-3.git
```
2. (WINDOWS ONLY) You'll have to rename the makefiles in this repository to make sure that `make` commands run correctly
``` sh
# In Powershell, from the project directory:
$ mv makefile makefile.unix
$ mv makefile.win makefile
```

3. Set up this project's virtual environment and install all dependencies, using the included makefile for your OS
``` sh
# From the project directory:
$ make setup

# Follow the instructions that printed out after the last command, then:
$ make finish_setup
```

You should now be ready to develop and/or build this project. Before you start to do any work, don't
forget to start up the virtual environment so that any modifications (added dependencies) don't
modify your system's install of Python (this is more important for Linux/MacOS than Windows).
``` sh
# On Windows:
$ .\.env\Scripts\Activate.ps1

# On Linux/MacOS:
$ . .env/bin/activate # (or activate.fish or activate.csh for fish and c shell, respectively)
```

## Building and Packaging Instructions
After going through this guide's setup instructions, you'll be able to build and package this project.

To build a standalone executable:
``` sh
$ make build

# or, for simpler syntax:
$ make
```

(packaging instructions coming soon)
