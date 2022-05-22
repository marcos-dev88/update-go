#!bin/bash 

CHOSENGOPATH=""
GOCHOSENVERSION=""


setGoVersion()
{
	GOCHOSENVERSION="$1"
}

checkPath()
{
	save_go_path=$1
	if [ ! -z "$save_go_path" -a "$save_go_path" != " " ]; then

			if [[ ! -d "$save_go_path" ]]; then
				
				echo "the path $save_go_path do not exists."	
			else
				CHOSENGOPATH="$1"
			fi
		else 
			CHOSENGOPATH="not_defined"
	fi
}

while getopts ":v:p:" flagOption; do
	case $flagOption in 
		v)
			setGoVersion "$OPTARG" >&2	
			;;
		p)
			checkPath "$OPTARG" >&2	
			;;
			
		:)
			GOCHOSENVERSION="didn't work"
			echo "caiu aqui"
			exit 1	
			;;
			 
	esac
done


wget https://go.dev/dl/go"$GOCHOSENVERSION".linux-amd64.tar.gz 2>&1 | grep -i "failed\|error" > update_go.log &

pid=$!

while ps -p $pid &>/dev/null ; do
	echo -ne "Downloading...\r"
done

if [ -s "update_go.log" ]; then 
	echo "This version is not available, try to check available versions at https://go.dev/doc/devel/release"
else
	if [ "$CHOSENGOPATH" == "not_defined" ] || [ "$CHOSENGOPATH" == "" ] || [ "$CHOSENGOPATH" == " " ] ; then
		echo "Golang with version $GOCHOSENVERSION was successfully downloaded! Installing..."
		sudo rm -rf "$GOROOT" && sudo tar -C /usr/local -zxf ./go"$GOCHOSENVERSION"*;

		sudo cp "$GOROOT"/bin/go "$GOROOT"/bin/gofmt /usr/bin; 

		echo "Golang version $GOCHOSENVERSION is now installed!"

		go version;

		rm -f ./go"$GOCHOSENVERSON"*
	else
		mv go"$GOCHOSENVERSION"* "$CHOSENGOPATH"
		echo "go tar file is now installed at path $CHOSENGOPATH to install it manually"
	fi
fi


