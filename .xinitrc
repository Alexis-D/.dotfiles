#!/bin/sh

#do not let this if openbox
#jump to the [2]web tag
#sleep 1s && wmiir xwrite /ctl view [2]web& 
xcompmgr&
numlockx on&
gmixer -d&
xautolock -locker "xlock -mousemotion +description -mode blank -bg black -fg grey30" -time 3&

#exec ck-launch-session openbox-session
exec ck-launch-session wmii
