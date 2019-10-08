#!/bin/bash
killall dmenu
case "$(echo -e "Cancel\nShutdown\nRestart\nLogout\nSuspend\nLock" | dmenu \
    -nb "${COLOR_BACKGROUND:-#151515}" \
    -nf "${COLOR_DEFAULT:-#aaaaaa}" \
    -sf "${COLOR_HIGHLIGHT:-#589cc5}" \
    -sb "#1a1a1a" \
    -m eDP1 \
    -h 15 \
    -w 150 \
    -y 20 \
    -x 1770 \
    -i -l 6)" in
        Shutdown) exec systemctl poweroff;;
        Restart) exec systemctl reboot;;
        Logout) exec bspc quit;;
        Suspend) exec systemctl suspend;;
        Lock) exec /home/jhewers/.local/bin/lock;;
	Cancel);;
esac
