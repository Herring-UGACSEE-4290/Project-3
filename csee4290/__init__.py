# File: __init__.py
# Author(s): CSEE 4290 Fall 2021

import click
import sys

from csee4290.assembler import assemble
from csee4290.disassembler import disassemble


@click.group()
def cli() -> None:
    '''The entry point for this applicaiton. This function allows click to route the program flow
       to the correct function given the arguments that are passed.'''
    pass


# Registering the assemble and disassemvble functions as candidates to be from from the terminal.
cli.add_command(assemble)
cli.add_command(disassemble)


# Detects whether or not this scipt has been frozen and, if so, calls the entry point when this
# script is run.
#
# This was added specifically for use with pyinstaller, so that produced executables can run
# Click apps.
if getattr(sys, 'frozen', False):
    cli(sys.argv[1:])
