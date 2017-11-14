#!/bin/sh
while true; do
	read -p "Do you wish to use these configurations? " yn
	    case $yn in
		[Yy]* ) echo "SO BE IT! "; ./vimbootstrap.sh; break;;
		[Nn]* ) exit;;
		* ) echo "Please answer yes or no.";;
	esac
done
