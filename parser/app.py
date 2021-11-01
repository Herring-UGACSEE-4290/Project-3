# File: app.py
# Author(s): CSEE 4290 Fall 2021

import click
import re
import json


condition_lookup = {
    "eq": 0,
    "ne": 1,
    "cs": 2,
    "hs": 2,
    "cc": 3,
    "lo": 3,
    "mi": 4,
    "pl": 2,
    "vs": 6,
    "vc": 7,
    "hi": 8,
    "ls": 9,
    "ge": 10,
    "lt": 11,
    "gt": 12,
    "le": 13,
    "al": 14
}


@click.command()
@click.argument('inputfile')
def assemble() -> None:
    '''Assembles the inputfile (a .asm file) into a format that can be ran by an implementation of
       the CIA (a .mem file).'''

    pass


def load_asm(filename):
    with open(filename) as asm_file:
        lines = asm_file.read().splitlines()

    # regex for each component
    re_mnem = re.compile('\s+([A-Za-z.]+).*$')
    re_label = re.compile('^(\w+):\s*$|^\.(\w+)\s*$')
    re_comment = re.compile('.*;(.*)$')
    re_args = re.compile('([^,\s][^\,]*[^,\s]*)')
    re_cond = re.compile('[bB]\.([a-zA-Z]+)')
    cond = None

    asm_data = []
    keys = ["label", "mnemonic", "args", "addr", "comment"]

    for line in lines:

        # skip iteration if line  is empty or only whitespace
        stripped_line = line.replace('\t', '').replace(' ', '')
        if not stripped_line:
            continue

        d = dict.fromkeys(keys)

        # find mnemonic
        mnemonic_obj = re_mnem.match(line)
        if mnemonic_obj:
            mnem_end_index = mnemonic_obj.end(1)
            mnemonic = mnemonic_obj.group(1)

            # save condtion if b.cond in cond variable, rename mnemonic to b.cond
            if 'B.' in mnemonic or 'b.' in mnemonic:
                cond = re_cond.findall(mnemonic)[0]
                mnemonic = 'b.cond'

            d["mnemonic"] = mnemonic

        # find label
        label_obj = re_label.match(line)
        if label_obj:
            # label returns multiple match groups, there may be a better regex
            if label_obj.group(0):
                label = label_obj.group(0)
            elif label_obj.group(1):
                label = label_obj.group(1)
            label.replace('.', '')

            d["label"] = label.replace(' ', '').replace('.', '').replace('\t', '').replace(
                ':', '')  # have to cleaup label, there may be a better regex

        # find comment
        comment_obj = re_comment.match(line)
        if comment_obj:
            comment_start_index = comment_obj.start(1)
            comment = comment_obj.group(1)
            d["comment"] = comment

        # find args
        if not label_obj:
            if comment_obj:
                line = line[mnem_end_index:comment_start_index-1]
            else:
                line = line[mnem_end_index:]

            args = re_args.findall(line)

            # convert hex string to int
            for i, arg in enumerate(args):
                if '#0x' in arg:
                    args[i] = int(arg[3:], 16)

            # convert register string to int
            for i, arg in enumerate(args):
                if type(arg) == str:
                    if 'x' in arg or 'X' in arg:
                        args[i] = int(arg[1:])

            # add condition to args if needed and reset cond
            if cond:
                args.insert(0, cond)
                cond = None

            # ensure args stays None type if empty list
            if args:
                d["args"] = args
            else:
                d["args"] = []

        asm_data.append(d)
    return asm_data


data = load_asm("test.asm")

for i in data:
    print(i)


@click.command()
@click.argument('inputfile')
def disassemble() -> None:
    '''Disassembles the inputfile (a .mem file) into a listing file that can be used for debugging
       (a .txt file).'''
    pass


addr = 0


def pseudo_mnemonics(line):
    if line["mnemonic"] == "org":
        addr = 0
        return True
    elif line["mnemonic"] == "mov32":
        return True
    elif line["mnemonic"] == "rmb":
        return True
    return False


def assemble_from_token(dict):
   instrs = None
   with open("instructions.json") as f:
       instrs = json.load(f)
   with open("output.mem", "a") as out:
      for (lineNum, line) in enumerate(dict):
            if line["label"]:
               continue
            opcode = 0
            if(pseudo_mnemonics(line)):
               continue
            else:
               for inst in instrs:
                  # Matches the op_conde mnemonic and the number of args
                  if instrs[inst]["op_code"].casefold() == line["mnemonic"].casefold() and len(instrs[inst]["args"]) == len(line["args"]):
                        # ors the op_code as the first 7 bits
                        opcode = opcode | int(instrs[inst]["instr"], 2)
                        # Gets the number of leading zeros for math later
                        leading_zero = len(
                           instrs[inst]["instr"]) - len(bin(opcode)[2:])
                        # Gets the arguments
                        for (index, arg) in enumerate(instrs[inst]["args"]):
                           if arg.get("Reg"):
                              # Shifts the current op_code right 3 and adds the register
                              opcode = (
                                    opcode << 3) | line["args"][index]
                              # Encodes the flags
                           elif arg.get("Flg"):
                              # Shifts the op_code right 3 and adds the flag
                              opcode = (
                                    opcode << 4 | condition_lookup[line["args"][index].lower()])
                              # Encodes the Immediate value
                           elif arg.get("Imm"):
                              # Shifts the op_code to make the immediate bits 15-0
                              offset = 32 - leading_zero
                              opcode = (opcode << (
                                    offset - len(bin(opcode)[2:]))) | line["args"][index]
                        # Ensures to opcode is 32 bits if it does not have leading zeros
                        if len(bin(opcode)[2:]) < 32 and not leading_zero:
                           opcode = opcode << (32 - len(bin(opcode)[2:]))
                        out.write('{0:08X} '.format(opcode))



if __name__ == '__main__':
    dict = load_asm("test.asm")
    assemble_from_token(dict)
