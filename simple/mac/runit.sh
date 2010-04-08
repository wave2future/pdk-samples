#!/bin/bash

. buildit_for_device.sh $1
if [ $? -ne 0 ];then
	exit 1
fi

if [ "$APP" == "" ];then
	echo "The application file/directory name is not set. Please edit the script buildit_for_device.sh to specify the APP variable."
	exit 1
fi

if [ "$EXEC" == "" ];then
        echo "The executable file name is not set. Please edit the script buildit_for_device.sh to specify the EXEC variable."
        exit 1
fi

scp -r -P 10022 $BUILDDIR/$APP root@localhost:/media/internal/$APP
novacom run file:///media/internal/$EXEC
