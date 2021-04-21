echo -n "keepass folder location? (skip the ~): "
read kpssdir

if [ -z "$kpssdir" ];
	then
		echo 'default is ~/Documents/keepass'

	else 
		sed  "s|Documents|$kpssdir|g" rclone-normal.service
fi

echo "it passed ifthen fine"
