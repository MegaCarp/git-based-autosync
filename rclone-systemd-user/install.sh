#!/bin/bash

# [CHANGE_HERE]

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
echo -n keepass folder location? skip the ~
read kpssdir
d -ie 's/Documents/$kpssdir/g' rclone-normal.service
