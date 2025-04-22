# /etc/skel/.bash_profile
echo start .bash_profile

ostype=$(uname)

if [ $ostype == "Darwin" ]; then
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/usr/local/Caskroom/miniforge/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
		eval "$__conda_setup"
	else
		if [ -f "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
			. "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh"
		else
			export PATH="/usr/local/Caskroom/miniforge/base/bin:$PATH"
		fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<
else
	echo initing conda
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/home/ubber/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
		eval "$__conda_setup"
	else
		if [ -f "/home/ubber/miniforge3/etc/profile.d/conda.sh" ]; then
			. "/home/ubber/miniforge3/etc/profile.d/conda.sh"
		else
			export PATH="/home/ubber/miniforge3/bin:$PATH"
		fi
	fi
	unset __conda_setup

	if [ -f "/home/ubber/miniforge3/etc/profile.d/mamba.sh" ]; then
		. "/home/ubber/miniforge3/etc/profile.d/mamba.sh"
	fi
	# <<< conda initialize <<<
fi
