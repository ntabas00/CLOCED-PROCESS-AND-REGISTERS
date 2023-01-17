add wave *

force reset 0
examine *
	# Register R0 gets 0000, R1=R2=R3=1000, min_out=max_out=1000 (because of initializations)
force clk 1
force din 0000	
force sel 11
run 5
examine *
	# No changes here
force clk 0	
force din 0011
run 5
examine *
	# R0 gets 0011, R1=0000, R2=R3=1000, min_out = 0000, max_out = 1000
force clk 1	
run 5
force clk 0
force din 0100
run 5
examine *

	# R0=0100, R1=0011, R2=0000, R3=1000, min_out = 0000, max_out = 1000
force clk 1	
run 5
force clk 0
force din 0111
run 5
examine *
	# R0=0111, R1=0100, R2=0011, R3=0000, min_out = 0000, max_out = 1000
force clk 1	
run 5
force clk 0
force din 1010
run 5
examine *
	# R0=1010, R1=0111, R2=0100, R3=0011, min_out = 0000, max_out = 1000
force clk 1	
run 5
force clk 0
force din 1100
run 5
examine *
	# R0=1100, R1=1010, R2=0111, R3=0100, min_out = 0000, max_out = 1010
force clk 1	
run 5
force clk 0
force din 1111
run 5
examine *
	# R0=1111, R1=1100, R2=1010, R3=0111, min_out = 0000, max_out = 1100
force clk 1	
run 5
force clk 0
force din 0001
run 5
examine *
	# R0=0001, R1=1111, R2=1100, R3=1010, min_out = 0000, max_out = 1111
force clk 1	
run 5
examine *
	# Reset applied: R0=R1=R2=R3=1000, min_out = 0000, max_out = 1111
force reset 1
force clk 0	
run 5
examine *
force clk 1	
run 5
examine *
