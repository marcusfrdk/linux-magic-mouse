/etc/init.d/bluetooth stop
/etc/init.d/bluetooth start
sleep 3s
echo 'connect DEVICE-MAC-ADDRESS' | bluetoothctl
sleep 1s
echo 'connect ANOTHER-DEVICE-MAC-ADDRESS' | bluetoothctl
sleep 5s
sudo modprobe -r hid-magicmouse
sudo modprobe hid-magicmouse emulate_scroll_wheel=Y emulate_3button=Y middle_click_3finger=Y scroll_acceleration=Y scroll_speed=12
