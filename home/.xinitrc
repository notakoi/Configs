setxkbmap -layout us -variant intl
#xmodmap -e "clear lock"
#xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
#xmodmap -e "keycode 66 = Escape NoSymbol Escape"
#xrandr --output DP-1 --auto --pos 0x0 --rotate normal --output HDMI-1 --auto --pos -1080x-820 --rotate left --output DP-2 --auto --pos 1920x0 --rotate normal
#xinput --set-prop 10 'libinput Accel Speed' -0.7
#xinput --set-prop 10 'libinput Accel Profile Enabled' 0, 1

default=dwm

session=${1:-"$default"}
case $session in
	plasma ) 	export DESKTOP_SESSION=plasma
				exec dbus-run-session startplasma-x11 ;;
	dwm )		export _JAVA_AWT_WM_NONREPARENTING=1
				export AWT_TOOLKIT=MToolkit
				wmname LG3D
				pipewire &
				pipewire-pulse &
				wireplumber &
				nitrogen --restore &
				picom -f &
				# st bash -c "source /etc/profile.d/chkcryptoboot-profilealert.sh ; neofetch ; bash" &
				exec dbus-launch dwm;;
esac
