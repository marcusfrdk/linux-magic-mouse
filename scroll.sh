/etc/init.d/bluetooth stop
/etc/init.d/bluetooth start
sleep 3s
echo 'connect 00:00:00:00:00:00' | bluetoothctl
sleep 1s
echo 'connect 00:00:00:00:00:01' | bluetoothctl
sleep 5s
sudo modprobe -r hid-magicmouse
sudo modprobe hid-magicmouse emulate_scroll_wheel=Y emulate_3button=Y middle_click_3finger=Y scroll_acceleration=Y scroll_speed=12
