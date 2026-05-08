# vacuum_utility
this utility is for cleaning .log files from target directories based on age 
it uses the syntax ./vacuum.sh "name of directory" "max age in days"
so "./vacuum.sh var/log/syslog 15" would delete any syslog file older than 15 days.
the modifier "cannister" can be added to the command to display files that would be deleted if the command was executed
ex "./vacuum.sh var/log/syslog 15 cannister" would show but not delete syslog files older than 15days

