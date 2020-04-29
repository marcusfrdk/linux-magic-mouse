# Apple Magic Mouse 1/2 Support for Linux
I have for long used Ubuntu Desktop as my primary OS with my Macbook as my secondary, hence the Magic Mouse. I realized Linux doesn't natively support the scroll function on the mouse so I created my own script for adding this support.

## Precautions
In order to use this command, you firstly have to know the MAC-address of your device(s) (If you are using more than one bluetooth device), since this script will reboot the bluetooth module on your device and connect to your device(s). The script needs to be in sudo since systemd required admin priviliges.

## Installation
The script is simple, simply copy the code below and paste it in a a BASH-file (.sh extension).

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
echo 'connect [ANOTHER MAC-ADDRESS]' | bluetoothctl
sleep 5s
```

**Note that this script worked for my on Ubuntu 18.10 and may not work for you. The script should work without any additional packages. If this does not work, feel free to contact me and I can try to help you out.**
