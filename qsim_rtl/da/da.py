import os, sys
import re, math
import numpy as np


def read_rom(name):
	rom	= open("./rom/{}".format(name), "r")
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
	rom0	= read_rom("rom0")
	rom1	= read_rom("rom1")
	rom2	= read_rom("rom2")
	rom3	= read_rom("rom3")
	rom4	= read_rom("rom4")
	rom5	= read_rom("rom5")
	rom6	= read_rom("rom6")
	rom7	= read_rom("rom7")
	rom	= [rom0, rom1, rom2, rom3, rom4, rom5, rom6, rom7]
	inputs	= read_inputs("./reports/control.rpt")
	outputs	= read_outputs("./reports/output.rpt")
	results	= open(sys.argv[1], "w")
	matches	= 0;
	errors	= 0;
	for i, element in enumerate(inputs):
		acc_value	= 0
		for j, row in enumerate(element):
			row_value	= 0
			for rom_number, address in enumerate(row):
				address_value	= rom[rom_number][address]
				row_value	+= address_value
			acc_value = (acc_value * 2) + row_value
		if (acc_value == int(outputs[i])):
			matches	+= 1
			results.write("MATCH|| EXPECTED VALUE: {:>12d}\t ACTUAL VALUE: {:>12d}\n".format(acc_value, int(outputs[i])))
		else:
			errors	+= 1
			results.write("ERROR|| EXPECTED VALUE: {:>12d}\t ACTUAL VALUE: {:>12d}\n".format(acc_value, int(outputs[i])))
	print("MATCHES: {}".format(matches))
	print("ERRORS:  {}".format(errors))
	print("DONE.")
	return
		
if __name__ == "__main__":
	main()
	sys.exit(0)
