#! /bin/bash
if [[ "$(basename -- "$0")" == "bitlogin.sh" ]]; then
    echo "Don't run $0, source it" >&2
    exit 1
fi

if [ -z ${BW_SESSION+x} ]; then
	retCode=1
	while [ $retCode -gt 0 ]
	do
		echo -n "Insert bitwarden password: " 
		read -s password
		temp=$(bw unlock $password --raw)
		retCode=$?
	done
	export BW_SESSION=$temp
	unset password
	echo
fi

