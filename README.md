# Single Cycle Computer Project

Single Cycle Computer Project Repository.

## Environment Setup

First, make sure you have Icarus Verilog and GTKwave installed via the Getting Started instructions for this class.

Then, make sure you have a version of Python 3 installed on your computer. You can use the [official Python website for installation instructions](https://www.python.org/downloads/).

Next, make sure you have `make` installed on your system. For Linux users it should already be installed, and instructions for MacOS and Windows are below:

### Make for Windows

To install `make` on Windows systems, you'll need to first have either MSYS2 (recommended) or Windows Subsystem for Linux (WSL) installed. For instructions on installing and using MSYS2/WSL, please see the instructions included with the Lab 4 files in the [Labs repository](https://github.com/Herring-UGACSEE-4290/Labs).

Once you have MSYS2/WSL setup properly by following the instructions in Lab 4, we can begin to install our requirements.

#### MSYS2 Instructions

Open up an MSYS2 terminal and enter the following command to install make:
```
pacman -S make
```
Test this installation by running the following command in a normal command prompt or PowerShell:
```
make --version
```
If you get some boilerplate text and a version number, you're all set!

#### WSL Instructions

Open up a WSL terminal and enter the following command to make sure make is installed:

sudo apt install gcc gdb make

After entering your WSL password and following the prompts, ensure everything installed correctly by executing this command:
```
make --version
```

### Make for MacOS

To make sure we have `make` installed on MacOS, we'll need to use the homebrew package manager. If you don't already have homebrew installed on your MacOS machine, install it using this command:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Then, make sure you're package list is updated:
```
brew update
brew upgrade
```
Now, install make:
```
brew install make
```
and make sure everything worked:
```
make --version
```

Now you should be all set to use this repo!

## How to Use This Repository

Now that you have your dependencies setup, you can begin to use this repo for developing your single cycle computer!


