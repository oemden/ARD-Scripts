#!/bin/bash

## v0.1 only one harcoded admin
## TODOs :
## add $1 input for the admin - done

## either edit Admin below or as input argument
adminuser=( "admin" )

if [[ ! -z "${1}" ]] ; then
	adminuser="${1}"
fi

echo "adminuser: $adminuser"

function sudo_check {
## sudo Check
if [ `id -u` -ne 0 ] ; then
	printf "must be run as sudo, exiting"
	echo 
	exit 1
fi
}

function kickstart_ard {
	kickstart="/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart"
	systemsetup -setremotelogin on
	/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -allowAccessFor -specifiedUsers
	/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -users "$adminuser" -access -on -privs -all
	/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -activate -restart -console
}

## do it
#sudo_check
#kickstart_ard

exit 0
