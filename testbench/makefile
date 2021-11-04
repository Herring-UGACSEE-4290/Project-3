CC=iverilog
CFLAGS=-Wall -Wno-timescale -Wno-implicit-dimensions

testbench.vvp: 
	$(CC) $(CFLAGS) -t vvp -y src/ -s testbench src/* tests/* -o testbench.vvp