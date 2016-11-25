#!/bin/sh

# auto login disabled
ald=defaults read /Library/Preferences/com.apple.loginwindow autoLoginUser
#ald=$(defaults read /Library/Preferences/com.apple.loginwindow GuestEnabled 2>&1)
echo "ald: $ald"
