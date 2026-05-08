#!/usr/bin/bash
#targeted log cleaner
vacuum() {
local log_dir=$1
local days_old=$2
local dry_run=$3
#input validation
if [ ! -d "$log_dir" ]; then
echo "rug not found"
return 1
fi
if ! [[ "$days_old" =~ ^[0-9]+$ ]] ;then
#echo "DEBUG value is '$days_old'"
#echo "DEBUG lenth is ${#days_old}"
echo "no time travel"
return 1
fi
echo "on it!"
if [ "$dry_run" = "cannister" ]; then
echo "cannister mode"
echo "files that will be vacuumed"
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-"
find "$log_dir" -name "*.log" -type f -mtime +$days_old
else
echo "cleaning mode"
echo "BRRRRRRRRRRRRRRRRRRRRRRRR"
echo "=-=-=-=-=-=-=-=-=-=-=-=-="
find "$log_dir" -name "*.log" -type f -mtime +$days_old -print -delete
echo ""
echo "vacuuming finished"
fi
}
	if [ $# -eq 0 ]; then
	echo "syntax 'vacuum <dir> <daysold> <cannister>'"
	echo "for dry run 'vacuum /var/log/messages 30 cannister'"
	echo "this will display files without deletion"
	echo "for deletion 'vacuum /var/log/messages 30'"
	echo "this will delete all message files older than 30 days"
	exit 1
	fi
#execute function
vacuum "$1" "$2" "$3"
