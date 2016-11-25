#!/bin/sh

# auto login disabled
ald=$(defaults read /Library/Preferences/com.apple.loginwindow autoLoginUser 2>&1)
#ald=$(defaults read /Library/Preferences/com.apple.loginwindow GuestEnabled 2>&1)
echo "ald: $ald"
