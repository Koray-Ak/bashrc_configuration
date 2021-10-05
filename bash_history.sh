#!/bin/bash
#This script is only for user gisadmin

bashrc="/home/gisadmin/.bashrc"
Red='\033[0;31m'
Green='\033[0;32m'
NC='\033[0m'

#HISTCONTROL=ignoreboth has been changed HISTCONTROL=ignoredups
HISTCONTROL="$(cat $bashrc | grep HISTCONTROL=)"
sed -i s/HISTCONTROL=.*/HISTCONTROL=ignoredups/g $bashrc
if [ "$HISTCONTROL" = "HISTCONTROL=ignoredups" ]
then
	echo -e "${Green}$HISTCONTROL ${NC}already up-to-date"
else
	echo -e "${Red}$HISTCONTROL ${NC}has been changed ${Green}HISTCONTROL=ignoredups"
fi


#HISTFILESIZE=2000 has been changed HISTFILESIZE=
HISTFILESIZE="$(cat $bashrc | grep HISTFILESIZE=)"
sed -i s/HISTFILESIZE=.*/HISTFILESIZE=/g $bashrc
if [ "$HISTFILESIZE" = "HISTFILESIZE=" ]
then
	echo -e "${Green}$HISTFILESIZE ${NC}already up-to-date"
else 
	echo -e "${Red}$HISTFILESIZE ${NC}has been changed ${Green}HISTFILESIZE="
fi


# Insert a new format HISTTIMEFORMAT line 21
string="HISTTIMEFORMAT=.*"
bashrc="/home/gisadmin/.bashrc"
HISTTIMEFORMAT="$(cat $bashrc | grep HISTTIMEFORMAT=)"

if grep -q "$string" "$bashrc" ; then
        sed -i 's/HISTTIMEFORMAT=.*/HISTTIMEFORMAT="%F %T "/g' $bashrc
        echo -e "${Red}$HISTTIMEFORMAT ${NC}has been changed ${Green}HISTTIMEFORMAT=\"%F %T "\"""
else
        sed -i '21 i HISTTIMEFORMAT="%F %T "' $bashrc
        echo -e "${NC}Insert a new format at line 21 ${Green}HISTTIMEFORMAT=\"%F %T "\"""
fi
