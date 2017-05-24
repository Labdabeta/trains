#!/bin/bash

case $(whoami) in
	'louis' )
		scp kernel.elf laburke@linux.student.cs.uwaterloo.ca:/u/cs452/tftp/ARM/laburke/kernel.elf
		;;
	'laburke' )
		cp kernel.elf /u/cs452/tftp/ARM/laburke/kernel.elf
		;;
	'tkolomat' )
		cp kernel.elf /u/cs452/tftp/ARM/tkolomat/kern.elf
		;;
esac
