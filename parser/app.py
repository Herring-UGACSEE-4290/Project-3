# File: app.py
# Author(s): CSEE 4290 Fall 2021

import click
import json


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


addr = 0
labels = {}
def assemble_from_token(dict):
    f = open("instructions.json")
    instrs = json.load(f)
    for i, line in enumerate(dict):
        if line.label is not None:
            labels[line.label].append(addr)
        if(pseudo_mnemonics(line)):
            pass
        else:
            addr += 4

        
        




def pseudo_mnemonics(line):
    if line.mnemonic == "org":
        addr = 0
        return True
    elif line.mnemonic == "mov32":
        return True
    return False