import os, sys
import re, math
import numpy as np


def read_rom(name):
	rom	= open(name, "r")
	array	= np.loadtxt(rom, delimiter=",")
	x	= list(array)
	array	= np.asarray(x).astype("int")
	return array

def read_inputs(name):
	ins	= open(name, "r")
	lines	= ins.readlines()
	ins.close()
	inputs	= list()
	curr	= list()
	for i, line in enumerate(lines):
		line	= line.strip().split(",")
		if (len(line) != 8):
			curr	= np.asarray(curr)
			inputs.append(curr)
			curr	= list()
			continue
		else:
			line	= np.asarray(line).astype("int")
			curr.append(line)
			continue
	inputs	= np.asarray(inputs)
	return inputs
def read_outputs(name):
	outs	= open(name, "r")
	lines	= outs.readlines()
	outputs	= list()
	for i, line in enumerate(lines):
		line	= line.strip().split()
		if (len(line) != 1):
			continue
		else:
			line	= np.asarray(line).astype("int")
			outputs.append(line)
			continue
	outputs	= np.asarray(outputs)
	return outputs

# Assumes CSV Input File: <start><A7
def main():
	if (len(sys.argv) != 5):
		print("Usage python ./da.py <ROM Path> <Input File> <Output File> <Report Path>")
		sys.exit(0)
	rom0	= read_rom(sys.argv[1] + "rom0")
	rom1	= read_rom(sys.argv[1] + "rom1")
	rom2	= read_rom(sys.argv[1] + "rom2")
	rom3	= read_rom(sys.argv[1] + "rom3")
	rom4	= read_rom(sys.argv[1] + "rom4")
	rom5	= read_rom(sys.argv[1] + "rom5")
	rom6	= read_rom(sys.argv[1] + "rom6")
	rom7	= read_rom(sys.argv[1] + "rom7")
	rom	= [rom0, rom1, rom2, rom3, rom4, rom5, rom6, rom7]
	inputs	= read_inputs(sys.argv[2])
	outputs	= read_outputs(sys.argv[3])
	results	= open(sys.argv[4], "w")
	matches	= 0;
	errors	= 0;
	for i, element in enumerate(inputs):
		acc_value	= 0
		for j, row in enumerate(element):
			row_value	= 0
			for rom_number, address in enumerate(row):
				rom_number	= 7 - rom_number
				address_value	= rom[rom_number][address]
				row_value	+= address_value
			if (j == 0):
				acc_value = (acc_value * 2) - row_value
			else:
				acc_value = (acc_value * 2) + row_value
		if (acc_value == int(outputs[i])):
			matches	+= 1
			results.write("MATCH|| EXPECTED VALUE: {:>12d}\t ACTUAL VALUE: {:>12d}\n".format(acc_value, int(outputs[i])))
		else:
			errors	+= 1
			results.write("ERROR|| EXPECTED VALUE: {:>12d}\t ACTUAL VALUE: {:>12d}\n".format(acc_value, int(outputs[i])))
	print("MATCHES: {}".format(matches))
	print("ERRORS:  {}".format(errors))
	print("Error Report Written to {}".format(sys.argv[4]))
	print("DONE.")
	return
		
if __name__ == "__main__":
	main()
	sys.exit(0)
