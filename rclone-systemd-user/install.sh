#!/bin/bash

REQUIRED_PKG="rclone"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  sudo apt-get --yes install $REQUIRED_PKG
fi

rclone config create gdrive drive

# сюда логи
mkdir ~/.journals

# possibly change keepass folder (there's a default setting) . this is mainly for localization but also to futureproof
echo -n "keepass folder location? (skip the ~, default is ~/Documents/): "
read kpssdir

if [ -z "$kpssdir" ];
	then
		echo 'default is ~/Documents/keepass'

	else 
		sed -i   "s|Documents|$kpssdir|g" rclone-normal.service
fi

# checking who's current user and putting it in for the absolute paths
sed -i   "s|stashko|$USER|g" rclone-normal.service

ln ./rclone-normal.service ~/.config/systemd/user/rclone-normal.service

systemctl --user daemon-reload
systemctl --user enable --now rclone-normal.service

