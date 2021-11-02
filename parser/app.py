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

def pop_header(lines, line_data):
    '''
    remove header from lines data for ease of parsing. returns header as list of strings if desired
    removes corresponding dicts from line_data
    '''
    start_found = False
    for i,line in enumerate(lines):
        if line[:6] == "start:":
            start_found = True
            header_index = i
            header = lines[:header_index]

    if not start_found:
        print("start: does not begin assembly")
        quit()

    lines = lines[header_index:]
    line_data = line_data[header_index:]

    return lines, line_data, header

def parse_comments(line):
    '''
    remove comment from line

    return line and comment
    '''

    comment = None

    re_comment = re.compile('.*;(.*)$')

    comment_obj = re_comment.match(line)

    if comment_obj:
        comment_start_index = comment_obj.start(1)
        comment = comment_obj.group(1)
        line = line[:comment_start_index-1]

    return line, comment
    


def del_blanklines(lines, line_data):
    '''
    remove line if the only data is whitespace
    remove corresponding dicts from line_data
    '''
    re_blank = re.compile('^\s*$')
    for i, line in enumerate(lines):
        blank_obj = re_blank.match(line)
        if blank_obj:
            del lines[i]
            del line_data[i]

    return lines, line_data

def get_line_type(line, type_label, type_instruction, error):
    '''
    input line as a string, return true or false for label, instruction or error
    '''

    re_label = re.compile('^([a-zA-Z0-9_]+):\s*$')
    re_instruction = re.compile('^\s+\w+')

    label_obj = re_label.match(line)
    instruction_obj = re_instruction.match(line)

    if label_obj and not instruction_obj:
        type_label = True

    elif instruction_obj and not label_obj:
        type_instruction = True
        
    else:
        error = "Could not determine if line is instruction or label"

    return type_label, type_instruction, error

def parse_label(line):
    re_label = '^([a-zA-Z0-9_]+):\s*$'
    label_obj = re.search(re_label, line)
    
    label = label_obj.group(1) #group 0 contains the entire string, group 1 contains the match

    return label

    
def parse_instruction(line):

    re_mnem = re.compile('\s+([A-Za-z.]+).*$')
    re_cond = re.compile('[bB]\.([a-zA-Z]+)')
    
    mnemonic_obj = re_mnem.search(line)

    cond = None
    mnem_end_index = None
    mnemonic = None
    error = None
    target = None
    args = []

    if mnemonic_obj:
        mnem_end_index = mnemonic_obj.end(1)
        mnemonic = mnemonic_obj.group(1)

        #save condtion if b.cond in cond variable, rename mnemonic to b.cond
        if 'B.' in mnemonic or 'b.' in mnemonic:
            cond = re_cond.findall(mnemonic)[0]
            mnemonic = 'b.cond'


        #remove mnemonic from line within the function scope for easier parsing
        line = line[mnem_end_index:]
        
        args = parse_arguments(line, cond)
        
    else:
        error = "could not parse mnemonic"
        return mnemonic, args, error

    return mnemonic, args, error

def parse_arguments(line, cond):
    '''
    return a list of singleton dictionaries with argument type as label
    types: register, immediate, shift, condition
    '''

    line = line.replace('\t', '').replace(' ', '')

    if not line:
        return None

    args = line.split(',')

    if cond:
        temp = {'condition': None}
        temp['condition'] = cond

        args.append(temp)

    if len(args) == 0:
        return None


    conditions = ['eq', 'ne', 'cs', 'hs', 'cc', 'lo', 'mi', 'pl', 'vs', 'vc', 'hi', 'ls', 'ge', 'lt', 'gt', 'le', 'al']

    print(args)


    #convert hex string to int
    for i,arg in enumerate(args):

        print(arg)

        if '#0x' in arg:
            temp = {'immediate': None}
            temp['immediate']= int(arg[3:],16)
            args[i] = temp
            continue

        if type(arg) == str: #check type now that some elements have changed
            if 'r' == arg[0] or 'R' == arg[0]:
                temp = {'reg': None}
                temp['reg'] = int(arg[1:])
                args[i] = temp
                continue

        if type(arg) == str:
            if '#' in arg: #since already checked hex, # must mean shift value
                temp = {'shift': None}
                temp['shift'] = int(arg[1:])
                args[i] = temp
                continue

        if type(arg) == str:
            if arg.lower() in conditions:
                temp = {'condition': None}
                temp['condition'] = arg.lower()
                args[i] = temp
                continue

        if type(arg) == str: #assume the last possible argument would be branch target
            print(arg)
            temp = {'target': None}
            temp['target'] = arg
            args[i] = temp
            continue

    return args

def append_instruction_number(line_data):
    '''
    input line_data, return line_data with instruction number for instructions (not for labels)
    '''

    count = 0
    for i, line_dict in enumerate(line_data):
        if not line_dict["label"]:
            line_data[i]["instruction number"] = count
            count += 1
        else:
            continue


    return line_data



def load_asm(filename):
    line_data = []
    keys = ["label", "mnemonic", "args", "addr", "comment", "line number", "instruction number", "errors"]
    header = None

    with open(filename) as file:
        lines = file.read().splitlines()

    #initialize line_data and populate line number
    for i, line in enumerate(lines):
        d = dict.fromkeys(keys)
        d["line number"] = i + 1
        line_data.append(d)

    #first do cleanup on all lines
    lines, line_data, header = pop_header(lines, line_data) #header does not do anything. kept for potential future use

    lines, line_data = del_blanklines(lines, line_data)

    #now parse line by line
    for i, line in enumerate(lines):

        type_label = False
        type_instruction = False
        error = None

        line, comment = parse_comments(line)
        if comment:
            line_data[i]["comment"] = comment

        
        type_label, type_instruction, error = get_line_type(line, type_label, type_instruction, error)
        if error:
            line_data[i]["error"] = error
            continue

        if type_label:

            label = parse_label(line)
            if error:
                line_data[i]["error"] = error
                continue

            line_data[i]["label"] = label

        elif type_instruction:

            mnemonic, args, error = parse_instruction(line)
            if error:
                line_data[i]["error"] = error
                continue

            line_data[i]["mnemonic"] = mnemonic
            line_data[i]["args"] = args
        else:
            print("typing error") #handle this the correct way
            continue

    line_data = append_instruction_number(line_data)

    return line_data

# data = load_asm("test.asm")

# for i in data:
#    print(i)

@click.command()
@click.argument('inputfile')
def disassemble() -> None:
    '''Disassembles the inputfile (a .mem file) into a listing file that can be used for debugging
       (a .txt file).'''
    pass

def pseudo_mnemonics(line):
    if line["mnemonic"] == "org":
        addr = 0
        return True
    elif line["mnemonic"] == "mov32":
        return True
    return False

addr = 0
labels = {}
def assemble_from_token(lines):
    global addr
    global labels
    f = open("instructions.json")
    instrs = json.load(f)
    for i, line in enumerate(lines):
        if line["label"] is not None:
            labels[line["label"]] = addr
        if(pseudo_mnemonics(line)):
            pass
        else:
            addr += 4
        
        
def assemble_opcode(dict):
    instrs = None
    opcodes = []
    with open("instructions.json") as f:
       instrs = json.load(f)    
    for (lineNum, line) in enumerate(dict):
        if line["label"]:
            continue
        opcode = 0
        label = None
        if(pseudo_mnemonics(line)):
            continue
        else:
            for inst in instrs:
                # Matches the op_code mnemonic and the number of args
                if instrs[inst]["op_code"].casefold() == line["mnemonic"].casefold() and len(instrs[inst]["args"]) == len(line["args"]):
                    # print(line)
                    # ors the op_code as the first 7 bits
                    opcode = opcode | int(instrs[inst]["instr"], 2)
                    # Gets the number of leading zeros for math later
                    leading_zero = len(instrs[inst]["instr"]) - len(bin(opcode)[2:])
                    # Gets the arguments
                    for (index, arg) in enumerate(instrs[inst]["args"]):
                        if arg.get("Reg"):
                            # Shifts the current op_code right 3 and adds the register
                            opcode = (opcode << 3) | line["args"][index]
                            # Encodes the flags
                        elif arg.get("Flg"):
                            # Shifts the op_code right 3 and adds the flag
                            opcode = (opcode << 4 | condition_lookup[line["args"][index].lower()])
                            # Encodes the Immediate value
                        elif arg.get("Imm"):
                            # Shifts the op_code to make the immediate bits 15-0
                            offset = 32 - leading_zero
                            opcode = (opcode << (offset - len(bin(opcode)[2:])))
                            try:
                                opcode = opcode | line["args"][index]
                            except:
                                label = line["args"][index]
                    # Ensures to opcode is 32 bits if it does not have leading zeros
                    if len(bin(opcode)[2:]) < 32 and not leading_zero:
                        opcode = opcode << (32 - len(bin(opcode)[2:]))
                    opcodes.append({"opcode":opcode,"label":label})
    return opcodes

def fill_labels(opcodes):
    for opcode in opcodes:
        if opcode["label"]:
            opcode["opcode"] = opcode["opcode"] | labels[opcode["label"]]
    return opcodes

def write_file(opcodes):
    with open("output.mem","a") as file:
        for opcode in opcodes:
            file.write('{0:08X} \n'.format(opcode["opcode"]))


if __name__ == '__main__':
    dict = load_asm("test.asm")
    assemble_from_token(dict)
    opcodes = assemble_opcode(dict)
    print("Before, ",len(opcodes))
    opcodes = fill_labels(opcodes)
    print("After, ",len(opcodes))
    write_file(opcodes)
    
