# Ubuntu 18.04 Magic Mouse 1 and 2 Support
I've been using Ubuntu Desktop as my primary OS for some time. And the mouse I've been using has been the Apple Magic Mouse 2, which Ubuntu does not natively support. I gathered as much information as I could and created this script to solve that problem.

## Requirements
- The device(s) MAC-address
- Apple Magic Mouse 1 or 2
- Ubuntu 18.04 (Maybe 20.04?)

## How to use
**1. Download or copy the scroll.sh file**<br/>
**2. Run the following commands:**
```
$ chmod +x ./scroll.sh
$ sudo ./scroll.sh # sudo is required to access the bluetooth.service
```
**3. Adding multiple devices (optional):**<br/>
In order to add multiple devices add the following code after line 4 (repeat for each connected bluetooth device):
```
sleep 1s
echo 'connect MAC-ADDRESS-OF-DEVICE' | bluetoothctl
sleep 5s
```
If you are using multiple bluetooth devices, add each separate device to the script. Since the script will disconnect all current devices.

## Personal Best Practices
- Adding a simple alias for the script like **alias scroll='/path/to/script/scroll.sh'** to the **.bashrc** file.
- Place the file in the user's root folder **~/scroll.sh**.
- Add the script to a cron-job, preferably on boot with the **crontab -e** command. Add **@reboot PATH/TO/SCRIPT** to the bottom of the script.
