########################################
# Check signal values with expected ones
#
#
# do check.do signal results_file
# Result of check in check.log
#
#
# xharrym 2015
########################################

set exp {[01U]{8}}
set str1 "EXPECTED: "
set str2 "SIMULATED: "

set signal $1
set filename_expected $2
set filename_log "check.log"
set fID_log [open $filename_log w+]
puts $fID_log "Checking for signal ${signal}:\n\n----------------------------------------------------\n"
set passed 0
set failed 0

set simulated [regexp -all -inline $exp [examine "${signal}"]]
set fID [open $filename_expected r]
set file_expected [read $fID]
close $fID
set n  0
set expected [split $file_expected "\n"]
foreach exp_value $expected {
        set sim_value [lindex $simulated [expr 24-$n]]
        if {$exp_value == $sim_value} {
                set res "  PASSED\n"
                incr passed
        } else {
                set res "  FAILED <---\n"
                incr failed
        }
        incr n
        if {$n == 25} {
                break
        }
        puts $fID_log "${str1}${exp_value} ${str2}${sim_value} ${res}"
}
puts $fID_log "----------------------------------------------------\n\n                PASSED: ${passed}  FAILED: ${failed}\n----------------------------------------------------"
puts "End of checking, results in check.log ."

close $fID_log
