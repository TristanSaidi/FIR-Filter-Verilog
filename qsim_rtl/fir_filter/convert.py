import os, sys
import re, math

def main():
	fp	= open(sys.argv[1], "r")
	lines	= fp.readlines()
	fp.close()
	inputs	= list()
	for line in lines:
		line = line.strip().split()
		inputs.append(line)
	fp	= open(sys.argv[2], "w")
	for line in inputs:
		value	= int(line, 2)
		fp.write("{}\n".format(value))
	fp.close()
	return

if __name__ == "__main__":
	main
	sys.exit(0)
