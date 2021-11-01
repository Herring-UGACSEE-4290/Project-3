# File: disassembler.py
# Author(s): CSEE 4290 Fall 2021

import click
from click.termui import prompt

@click.command()
@click.argument('input_file')
@click.option('-o', '--output-file', prompt=True)
@click.option('-I', '--instruction-file', prompt=True)
def disassemble(input_file: str, output_file: str, instruction_file: str) -> None:
    '''Converts the contents of the hex machine code found in input_filename into a listing file
       that will be written to output_filename using instructions_filename.'''
    print(f'Disassembling {input_file} into {output_file} using {instruction_file} ......')

def hex_to_listing(machine_code: str) -> str:
    '''Returns the listing that corresponds to the opcode in machine_code in the format
       "<opcode> <mnemonic> <operands>...".'''
    pass
