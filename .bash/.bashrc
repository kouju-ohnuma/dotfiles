# setting alias 
exec -f "$HOME/.bash/.bash_aliases" 

# setting terminal
exec -f "$HOME/.bash/.bash_prompt" 

# .bash_completion.bash
exec -f "$HOME/.bash/.git_completion.bash" 

# projects setting
if [ -d "$HOME/.bash/projects" ]; then
	# .bashファイルが1つ以上あれば実行
	NUMBER_OF_BASH_FILE=$(find $HOME/.bash/projects/*.bash -type f | wc -l)
	if [ $NUMBER_OF_BASH_FILE -ne 0 ]; then
		cd "$HOME/.bash/projects" > /dev/null 2>&1
		for bashfile in *.bash; do
			exec -f $(pwd)/$bashfile
		done
		cd -  > /dev/null 2>&1
	fi
fi
