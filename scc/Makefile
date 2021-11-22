CC=iverilog
CFLAGS=-Wall -Wno-timescale -Wno-implicit-dimensions

SIM=vvp
SIMFLAGS=-lx2 +PROGRAM=

# If the first argument is "run"...
ifeq (simulate,$(firstword $(MAKECMDGOALS)))
  # use the rest as program argument for vvp
  PROGRAM := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

testbench.vvp: 
	$(CC) $(CFLAGS) -t vvp -y src/ -o testbench.vvp -s testbench src/* tests/*.v 

build: testbench.vvp

simulate: build
	$(SIM) testbench.vvp $(SIMFLAGS)$(PROGRAM)
	
clean:
	rm testbench.vvp