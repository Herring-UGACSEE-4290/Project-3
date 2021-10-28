# File: app.py
# Author(s): CSEE 4290 Fall 2021

import click
import re
import json


@click.command()
@click.argument('inputfile')
def assemble() -> None:
    '''Assembles the inputfile (a .asm file) into a format that can be ran by an implementation of
       the CIA (a .mem file).'''
    
    pass

def load_asm(filename):
   with open(filename) as asm_file:
      lines = asm_file.read().splitlines()


   #regex for each component
   re_mnem = re.compile('\s+([A-Za-z.]+).*$')
   re_label = re.compile('^(\w+):\s*$|^\.(\w+)\s*$')
   re_comment = re.compile('.*;(.*)$')
   re_args = re.compile('([^,\s][^\,]*[^,\s]*)')

   asm_data = []
   keys = ["label", "mnemonic", "args", "addr", "comment"]

   for line in lines:

      #skip iteration if line  is empty or only whitespace
      stripped_line = line.replace('\t','').replace(' ','')
      if not stripped_line:
         continue


      d = dict.fromkeys(keys)

      #find mnemonic
      mnemonic_obj = re_mnem.match(line)
      if mnemonic_obj:
         mnem_end_index = mnemonic_obj.end(1)
         mnemonic = mnemonic_obj.group(1)
         d["mnemonic"] = mnemonic


      #find label
      label_obj = re_label.match(line)
      if label_obj:
         #label returns multiple match groups, there may be a better regex
         if label_obj.group(0):
            label = label_obj.group(0)
         elif label_obj.group(1):
            label = label_obj.group(1)
         label.replace('.', '')
         
         d["label"] = label.replace(' ', '').replace('.', '').replace('\t', '').replace(':', '') #have to cleaup label, there may be a better regex

      
      #find comment
      comment_obj = re_comment.match(line)
      if comment_obj:
         comment_start_index = comment_obj.start(1)
         comment = comment_obj.group(1)
         d["comment"] = comment


      #find args
      if not label_obj:
         if comment_obj:
            line = line[mnem_end_index:comment_start_index-1]
         else:
            line = line[mnem_end_index:]

         args = re_args.findall(line)

         #convert hex to int
         for i,arg in enumerate(args):
            if '#0x' in arg:
               args[i] = int(arg[3:],16)
         
         #convert register string to int
         for i,arg in enumerate(args):
            if type(arg) == str: 
               if 'x' in arg or 'X' in arg:
                  args[i] = int(arg[1:])
         
         #ensure args stays None type if empty list
         if args:
            d["args"] = args

      asm_data.append(d)
   return asm_data

@click.command()
@click.argument('inputfile')
def disassemble() -> None:
    '''Disassembles the inputfile (a .mem file) into a listing file that can be used for debugging
       (a .txt file).'''
    pass


addr = 0
labels = {}
def assemble_from_token(lines):
    f = open("instructions.json")
    instrs = json.load(f)
    for i, line in enumerate(lines):
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