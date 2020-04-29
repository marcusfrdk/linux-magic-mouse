# Apple Magic Mouse 1/2 Support for Linux
I have used Ubuntu Desktop as my primary OS for some time with my Mac as my secondary OS, hence the Magic Mouse. I realized Linux doesn't natively support the scroll function on the Magic Mouse so I gathered the information I could find online and created my own script to support the Magic Mouse.

## Precautions
In order to use this command, you have to know the MAC-address of your device(s) (If you are using more than one bluetooth device), since this script will reboot the bluetooth module on your device and connect to your device(s). The script needs to be in sudo since bluetoothctl requires sudo priviliges.

## Installation
The script is simple, copy the code blow (or download the *scroll.sh* file from this repo and replace with your devices MAC-address) and paste it in a a BASH-file (.sh extension).

```
/etc/init.d/bluetooth stop
/etc/init.d/bluetooth start
sleep 3s
echo 'connect [MAC-ADDRESS GOES HERE]' | bluetoothctl
sleep 5s
modprobe -r hid-magicmouse
sudo modprobe hid-magicmouse emulate_scroll_wheel=Y emulate_3button=Y middle_click_3finger=Y scroll_acceleration=Y scroll_speed=12
```

If you have more devices connected, add the following code after the ECHO command as following:

```
...
sleep 1s
echo 'connect *[ANOTHER MAC-ADDRESS]*' | bluetoothctl
sleep 5s
```

**Note that this script worked for me on Ubuntu 18.04 and may not work for you. The script should work without any additional packages. If this does not work, feel free to contact me and I can try to help you out.**

## Recommendation and best practices
1. Add script to **user's root folder** (*~/scroll.sh*)
2. Add an alias for the script, so you only have to write a word in the terminal and the script runs. If you use bash, add an alias to the **.bashrc** file. Example: *alias scroll='sudo ~/scroll.sh'*
3. Add the script to a cron-job, preferably on boot with the **crontab -e** command. Add **@reboot PATH/TO/SCRIPT**

**By doing this it will feel like the mouse is natively supported by the os.**

Hope this helps you! If not, contact me and tell me what's wrong and I might be able to help you.
