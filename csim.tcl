# Open/reset the project
open_project sim -reset

# Top function of the design is "haar"
set_top detectFaces

# Add design and testbench files
add_files haar.cpp
add_files -tb main.cpp
add_files -tb image.cpp

open_solution solution
set_part xc7a12tcpg238-3
config_rtl -reset state
csim_design
cosim_design
# cysnth_design

# Set Solutions
# set solutions [list baseline pipelined parallel_pipelined]
# foreach solution $solutions{
#     open_solution $solution
#     set_part xc7a12tcpg238-3
#     config_rtl -reset state
#     csim_design
#     cosim_design
#     cysnth_design
# }

 
# Use Zynq device: zc-706
# set_part xc7z045ffg900-2


# report_timing_summary -file timing.txt
# report_power -file power.txt
# report_utilization -heirarchical -file power.txt

open_project -reset project
set_part  {xc7a12tcpg238-3}
create_clock -period 25
source run.tcl

csim_design
csynth_design
cosim_design
export_design

exit

