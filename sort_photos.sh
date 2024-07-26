#!/bin/bash
ls -lt "$1"/*.[jmp][pn][g4] | awk '
	BEGIN { month = "" }
	$6 == month { print "mv \""$9"\" "directory"/"month | "sh" }
	$6 != month { 
		month = $6;
		if (system("[ -d "directory"/"month" ]") == 0){
			print "found directory "directory"/"month;
 			print "mv \""$9"\" "directory"/"month | "sh" 
		}
		else {
			print "need a new dir\n";
			print "mkdir "directory"/"month | "sh"
 			print "mv \""$9"\" "directory"/"month | "sh" 
		}
	}
' directory="$1"
