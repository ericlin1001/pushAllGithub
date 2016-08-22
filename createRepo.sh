

####Github-create()###################
github-create() {
	repo_name=$1
	dir_name=`basename $(pwd)`

	if [ "$repo_name" = "" ]; then
		echo "Repo name (hit enter to use '$dir_name')?"
		#read repo_name
	fi

	if [ "$repo_name" = "" ]; then
		repo_name=$dir_name
	fi

	invalid_credentials=0
	username=`git config github.user`
	if [ "$username" = "" ]; then
		echo "Could not find username, run 'git config --global github.user <username>'"
		invalid_credentials=1
	fi
	pass=`git config github.pass`
	echo "using user:pass as  '$username':'$pass'"
	if [ "$pass" = "" ]; then
		echo "Could not find pass, run 'git config --global github.pass <pass>'"
		invalid_credentials=1
	fi
	if [ "$invalid_credentials" == "1" ]; then
		echo "invalid_credentials..."
		return 1
	fi

	echo -n "Creating Github repository '$repo_name' ..."
	curl -u "$username:$pass" https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"
	echo " done."
	#echo -n "Pushing local code to remote ..."
	git init
	git add .
	git commit -a -m 'first commit by script'
	git remote add origin git@github.com:$username/$repo_name.git
	git push -u origin master
	#git push -u origin master > /dev/null 2>&1
	echo " done."
}
github-create
											 #########end git-hub-create############
