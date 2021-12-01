import os, sys
import re, math

def main():
	fp	= open("./reports/golden_block.rpt", "w")
	for i in range(0, 2048):
		fp.write("{}\n".format(i))
	for i in range(0, 10000):
		fp.write("{},{}\n".format(i, -i))
	fp.close()
	return

if __name__ == "__main__":
	main()
	sys.exit(0)
