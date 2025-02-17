yosys -import
if { [info procs read_uhdm] == {} } { plugin -i systemverilog }
yosys -import  ;# ingest plugin commands

set TMP_DIR /tmp
if { [info exists ::env(TMPDIR) ] } {
  set TMP_DIR $::env(TMPDIR)
}

# Testing simple round-trip
read_systemverilog -o $TMP_DIR/counter-test $::env(DESIGN_TOP).v
write_verilog
