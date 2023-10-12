# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.16-s062_1 on Thu Oct 12 10:28:13 -03 2023

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design FFT

set_clock_gating_check -setup 0.0 
