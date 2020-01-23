#! /bin/bash
# by zocker1600 2019 - 2020

download_cr (){
	# check if all ENV variables are set
#	if [ -z "$username" ] || [ -z "$password" ];then
#		echo "you need to specify username and password!"
#		exit 1
#	else
		# download the specified version of the crowdrender addon
		echo "downloading version $CR_VERSION of crowdrender......"
		./download_cr.sh
		
		# install addon into blender
		echo "installing crowdrender addon......."
		/usr/local/blender/blender -b -noaudio --python install_addon.py
		
		# activate all GPUs (this is a workaround for a bug)
		echo "activating all available GPUs......"
		/usr/local/blender/blender -b -noaudio --python activate_gpu.py
		
		# show the installed version of blender for debugging purposes
		echo "blender launch test:"
		/usr/local/blender/blender -b --version
#	fi
}

start_server (){
	# start the CR server
	echo "starting crowdrender server....................."
	/usr/local/blender/blender -b -noaudio --python /root/.config/blender/2.81/scripts/addons/crowdrender/src/py_3_7/serv_int_start.py -- -ct "$token" -t "server_int_proc"
}


# check if crowdrender addon is already installed
if test -r "$CR_VERSION.zip"; then
	echo ""
	echo ""
	echo ""
	echo "-------------------------------------------------------------"
	echo "crowdrender is already installed"
	start_server
else
	download_cr
	start_server
fi
