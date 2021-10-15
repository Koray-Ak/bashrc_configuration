#!/bin/bash
#This script is only for user gisadmin


ROOT_UID=0     # Only users with $UID 0 have root privileges.
E_NOTROOT=87   # Non-root exit error.

# Run as Root or SUDO User, of course.
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be Root or SUDO User to run this script."
  exit $E_NOTROOT
fi

bashrc="/home/gisadmin/.bashrc"
	sed -i \
	-e "s|HISTCONTROL=ignoreboth|HISTCONTROL=ignoredups|g" \
	-e "s|HISTFILESIZE=2000|HISTFILESIZE=|g" \
$bashrc

#echo "HISTTIMEFORMAT=\"%F %T "\" >> $bashrc

string="HISTTIMEFORMAT"
if grep -q "$string" "$bashrc" ; then
exit
else
echo "HISTTIMEFORMAT=\"%F %T "\" >> $bashrc
fi
