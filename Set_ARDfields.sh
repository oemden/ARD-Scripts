#!/bin/sh
#
# oem at oemden dot com - Set ARD Fields
#

## EDIT BELOW as wanted or provide input argument
## $1 == Text1 ;  $2 == Text2 ;  $3 == Text3 ;  $4 == Text4 ; 
ARD1_FIELD="BU_BusinessUnit" # for example, BU_CompanyOne / BU_CompanyTwo
ARD2_FIELD="GP_Group" # for example, GP_Graphics, GP_Accounting, etc ...
ARD3_FIELD="KD_Kind" # for example, KD_Client / KD_Server, etc...
ARD4_FIELD="TP_Type" # for example, TP_VM / TP_VIP etc....

############ don't edit below unless you know what you're doing.

DEFAULTS=/usr/bin/defaults
ARD_PLIST="/Library/Preferences/com.apple.RemoteDesktop"

## sudo Check
if [ `id -u` -ne 0 ] ; then
	printf "must be run as sudo, exiting"
	echo 
	exit 1
fi

## Keys - Don't Change below !
ARD1_KEY="Text1"
ARD2_KEY="Text2"
ARD3_KEY="Text3"
ARD4_KEY="Text4"

## Check input
if [[ -z "${1}" ]] ; then
	echo "No input"
	ARD1_FIELD="${ARD1_FIELD}"
	ARD2_FIELD="${ARD2_FIELD}"
	ARD3_FIELD="${ARD3_FIELD}"
	ARD4_FIELD="${ARD4_FIELD}"
else
	ARD1_FIELD="$1"
	ARD2_FIELD="$2"
	ARD3_FIELD="$3"
	ARD4_FIELD="$4"
fi

echo "ARD1_FIELD: ${ARD1_FIELD}"
echo "ARD2_FIELD: ${ARD2_FIELD}"
echo "ARD3_FIELD: ${ARD3_FIELD}"
echo "ARD4_FIELD: ${ARD4_FIELD}"

function set_ARD() {
if [[ -n "${2}" ]] ; then
	"${DEFAULTS}" write "${ARD_PLIST}" "${1}" "${2}"
fi
}

set_ARD "${ARD1_KEY}" "${ARD1_FIELD}"
set_ARD "${ARD2_KEY}" "${ARD2_FIELD}"
set_ARD "${ARD3_KEY}" "${ARD3_FIELD}"
set_ARD "${ARD4_KEY}" "${ARD4_FIELD}"

exit 0
