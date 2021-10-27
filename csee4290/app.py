# File: app.py
# Author(s): CSEE 4290 Fall 2021

import click

@click.command()
@click.argument('inputfile')
def assemble() -> None:
    '''Assembles the inputfile (a .asm file) into a format that can be ran by an implementation of
       the CIA (a .mem file).'''
    pass

@click.command()
@click.argument('inputfile')
def disassemble() -> None:
    '''Disassembles the inputfile (a .mem file) into a listing file that can be used for debugging
       (a .txt file).'''
    pass
