# common.tcl setup library files

# 0.13um IBM Artisan Library
# Set library paths
set search_path [list "." \
                     "/afs/umich.edu/class/eecs427/tsmc65/stdcells/tcbn65lp_220a/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65lp_220a" \
                     "./../lib"\
                    ]

# Put the lib file of your mem in ./../lib folder
# Convert it to .db file
# Replace your_mem.db with the db filer of your mem
set link_library "* tcbn65lpbc.db  dw_foundation.sldb" 

set target_library "tcbn65lpbc.db"

