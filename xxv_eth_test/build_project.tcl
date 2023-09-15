if {[catch {exec rm -r vivado on error} issue]} {
    puts "Directory vivado does not exist"
}
exec mkdir vivado
cd vivado
source ../xxv_ethernet_project_setup.tcl

