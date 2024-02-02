if pgrep -x "wvkbd-mobintl" > /dev/null
then
    pkill wvkbd
else
    wvkbd-mobintl -L 325 &
fi
