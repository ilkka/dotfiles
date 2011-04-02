if [[ -d $HOME/bin ]]
then
	if [[ $PATH != *:#$HOME/bin:#* ]]
	then
		export PATH=$HOME/bin:$PATH
	fi
fi

