#!/bin/sh

case $SESSION in
    openbox)
        ;;
    dwm|wmii|*)
        xcompmgr&
        numlockx on&
        gmixer -d&
        xautolock -locker "xlock -mousemotion +description -mode blank -bg black -fg grey30" -time 3&
        ~/.fehbg&
        tilda&
        wmname LG3D& #for Java...
        status.sh&
        ;;
esac

exec ck-launch-session $SESSION

