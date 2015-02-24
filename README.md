# modelsim_results_validation
Tcl script for Modelsim that checks if the values of a signal are the same as the expected ones. 
The expected values are stored in an external file, one value per line, from 0 to N.

**Usage (in Modelsim):**

do check.do signal_name expected_values_file

The results of the validation are in the file *check.log*

**Note:**

The checked values are 8-bits long. To change it, modify the regexp in the first line of the Tcl script:
*set exp {[01U]{N}}* with N as the number of bits wanted.

