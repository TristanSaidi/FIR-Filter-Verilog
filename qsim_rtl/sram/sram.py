import os, sys
import re, math
import numpy as np


def read_rom(name):
	rom	= open("./rom/{}".format(name), "r")
	array	= np.loadtxt(rom, delimiter=",")
	x	= list(array)
	array	= np.asarray(x).astype("int")
	return array

def read_inputs(name, doskip=False):
	ins	= open(name, "r")
	lines	= ins.readlines()
	ins.close()
	inputs	= list()
	for i, line in enumerate(lines):
		try:
			if (doskip and i == 0):
				continue
			line	= line.strip().split(",")
			if (len(line) != 8):
				continue
			else:
				line	= np.asarray(line).astype("int")
				inputs.append(line)
				continue
		except Exception as e:
			print(e)
			continue
	inputs	= np.asarray(inputs)
	return inputs

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
	inputs	= read_inputs("./reports/inputs.rpt")
	outputs	= read_inputs("./reports/outputs.rpt", doskip=True)
	results	= open(sys.argv[1], "w")
	out_sz	= len(outputs)
	ins_sz	= len(inputs)
	if (out_sz < ins_sz):
		max_iter	= out_sz
	else:
		max_iter	= ins_sz
	matches	= 0;
	errors	= 0;
	for i, line in enumerate(inputs):
		if (i == max_iter):
			break
		for j, address in enumerate(line):
			rom_nr		= 7-j
			rom_value	= int(rom[rom_nr][address])
			out_value	= outputs[i][j]
			if (out_value != rom_value):
				errors	= errors + 1
				results.write("ERROR|| EXPECTED: {} OUTPUT: {}\n".format(rom_value, out_value))
			else:
				matches	= matches + 1
				results.write("MATCH|| EXPECTED: {} OUTPUT: {}\n".format(rom_value, out_value))
	print("MATCHES: {}".format(matches))
	print("ERRORS:  {}".format(errors))
	print("DONE.")
	return
		
if __name__ == "__main__":
	main()
	sys.exit(0)
