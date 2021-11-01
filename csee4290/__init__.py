# File: __init__.py
# Author(s): CSEE 4290 Fall 2021

import click
from csee4290.assembler import assemble
from csee4290.disassembler import disassemble

@click.group()
def entry_point() -> None:
   pass

entry_point.add_command(assemble)
entry_point.add_command(disassemble)


#def assemble(input_file, instruction_file) -> None:
#    '''Assembles the inputfile (an .asm file) into a format that can be ran by an implementation of
#       the CIA (a .mem file).'''
#    print(f'Assembling {input_file} to with instructions from {instruction_file} ...')



#@main.command()
#@click.argument('input_file')
#@click.option('-I', '--instruction-file')
#def disassemble(input_file, instruction_file) -> None:
    #'''Disassembles the inputfile (a .mem file) into a listing file that can be used for debugging
    #   (a .txt file).'''
#    print(f'Disassembling {input_file} with instructions from {instruction_file}...')