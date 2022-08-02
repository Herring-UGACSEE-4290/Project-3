# Single Cycle Computer Project

Single Cycle Computer Project Repository.

## Environment Setup

First, make sure you have Icarus Verilog and GTKwave installed via the Getting Started instructions for this class.

Then, make sure you have a version of Python 3 installed on your computer. You can use the [official Python website for installation instructions](https://www.python.org/downloads/).

Next, make sure you have `make` installed on your system. For Linux users, it should already be installed. Instructions for MacOS and Windows are below:

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

and ensure that everything worked:

```
make --version
```

Now you should be all set to use this repo!

## How to Use This Repository

Now that you have your dependencies set-up, you can begin to use this repo for developing your single cycle computer!

In the repository, you'll find a couple of directories:

```
|________ ________ ________ 
         |        |        |
       parser    scc     tests
```

`parser` contains the `assembler.py` and `instructions.json` files, which are used to convert your assembly code to a '.mem' file, which is readable by the testbench, and consequently your CPU.

`scc` contains the testbench file under the `tests` folder, and a small template for your Single Cycle Computer (`cpu.v`) under the `src` folder.

`tests` contains some sample test assembly files for you to use. They should all assemble correctly and be useful as a test for your Single Cycle Computer.

There is also a document called `scc.docx` which contains a load of more documentation about the class instruction set architecture, the project, and how to use the various tools and templates provided in this repository.

Generally, you'll read through the documentation in `scc.docx` and use that to construct and test your Single Cycle Computer. Your verilog for your Single Cycle Computer should live in `scc/src`, and your test assembly code should live in the `tests` folder.

As an example, to test and run your Single Cycle Computer with a particular test assembly file, execute the following command:

Linux:

```
python3 ../parser/assembler.py ../tests/<assembly file>.asm
```

Windows:

```
python ../parser/assembler.py ../tests/`<assembly file>`.asm
```

where `<assembly file>` is the assembly test file you wish to run. Then, change directory into the `scc` folder and execute the following commands:

```
make build
make simulate output.mem
```

which will compile the verilog in the `scc/src` folder and the `testbench.v` file with `testbench` being the top-level module. It will also simulate with the given `output.mem` file, and export that to a file called `dump.lx2` in the `scc` folder. You can view the simulation using `gtkwave`:

```
gtkwave dump.lx2
```
