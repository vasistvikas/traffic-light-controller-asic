# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Sat Mar 28 15:55:12 IST 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design trafficlight

create_clock -name "clk" -period 1.0 -waveform {0.0 0.5} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports rst]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {LED_NS[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {LED_NS[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {LED_NS[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {LED_WE[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {LED_WE[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {LED_WE[0]}]
set_wire_load_mode "enclosed"
set_clock_uncertainty -setup 0.01 [get_clocks clk]
set_clock_uncertainty -hold 0.01 [get_clocks clk]
