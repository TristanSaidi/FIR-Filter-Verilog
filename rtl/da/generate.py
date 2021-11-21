
fp	= open("fifo_interface.v", "w")
fp.write("\nmodule fifo_interface(")
for i in range (0, 8):
	i	= 8 - i
	if (i % 4) == 0:
		string = "\n\toutput\twire\t[7:0]\t"
	else:
		string = ""
	string	+= "A{}, ".format(i-1)
	fp.write(string)
for i in range (0, 64):
	i	= 64 - i
	if (i % 4) == 0:
		string = "\n\tinput\twire\t[15:0]\t"
	else:
		string = ""
	if (i == 1):
		string += "X{}\n);\n".format(i-1)
	else:
		string += "X{}, ".format(i-1)
	fp.write(string)
for i in range (0, 64):
	bit	= (i % 8) # Bit Position for Address.
	addr	= int(i / 8) # Address.
	string	= "\n\trshiftregne\tSREG_{}(\n".format(i)
	string += "\t\t\t.Q\t\t(A{}[{}]),\n".format(addr, bit)
	string += "\t\t\t.X\t\t(X{}),\n".format(i)
	string += "\t\t\t.shift_in\t(1'b0),\n"
	string += "\t\t\t.load\t\t(load),\n"
	string += "\t\t\t.enable\t\t(enable),\n"
	string += "\t\t\t.clk\t\t(clk),\n"
	string += "\t\t\t.resetn\t\t(resetn)"
	string += "\n\t\t\t);\n\t\t\tdefparam SREG_{}.n\t= 16;\n".format(i)
	fp.write(string)
fp.write("\nendmodule /* fifo_interface */\n")
fp.close()

