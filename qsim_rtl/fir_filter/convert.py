import os, sys
import re, math

def twos_comp(string):
	val	= int(string, 2)
	bits	= len(string)
	if (val & (1 << (bits - 1))) != 0:
		val = val - (1 << bits)
	return val
def fp2native(string):
	bits	= len(string)
	value	= 0.0
	for i in range(0, bits):
		if (string[i] == '1'):
			if (i == 0):
				value	= -1.0
			else:
				value	= value + (2.0**(-1 * i))
	return value
def parse_coeff(name):
	fp	= open(name, "r")
	lines	= fp.readlines()
	values	= list()
	for line in lines:
		line	= line.strip()
		value	= fp2native(line)
		values.append(value)
	return values
def main():
	values	= parse_coeff(sys.argv[1])
	fp	= open(sys.argv[1], "w")
	for item in values:
		string	= "{:1.15f}\n".format(item)
		fp.write(string)
	return

if __name__ == "__main__":
	main()
	sys.exit(0)

