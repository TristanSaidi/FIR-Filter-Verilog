import os, sys
import re, math

def twos_comp(val, bits):
	if (val & (1 << (bits - 1))) != 0:
		val = val - (1 << bits)
	return val 

def main():
	fp	= open(sys.argv[1], "r")
	lines	= fp.readlines()
	fp.close()
	inputs	= list()
	for line in lines:
		line = line.strip()
		inputs.append(line)
	fp	= open(sys.argv[2], "w")
	for line in inputs:
		value	= twos_comp(int(line,2), len(line))
		fp.write("{}\n".format(value))
	fp.close()
	return

if __name__ == "__main__":
	main()
	sys.exit(0)
