# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    birds.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tjose <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/17 13:48:56 by tjose             #+#    #+#              #
#    Updated: 2017/03/17 15:24:27 by tjose            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

project=$1
language=
filename=
yn=

usage="Usage: birds.sh project_directory_name"
noinput="Nothing entered, using project's name instead."
html_init="<!DOCTYPE html>\n<html>\n<body>\n\n<h1></h1>\n<p></p>\n\n</body>\n</html>"

git_ignore ()
{
	touch ../$project/.gitignore
	echo "*.co\n*.class\n*.dll\n*.exe\n*.o\n*.so\n*.7z\n*.dmg\n*.gz\n*.iso\n*.jar\n*.rar\n*.tar\n*.zip\n*.log\n*.sql\n*.sqlite\n.DS_Store\n._*" >> ../$project/.gitignore
}

if [ $# = 0 ]
then
	echo "$usage"
	exit 1
fi

if [ -d ../$project ]
then
	echo "That directory already exists!"
	exit 1
else
	mkdir ../$project
fi

echo "Select a language by entering a number:\n1. C\n2. C++\n3. SHELL\n4. PYTHON\n5. RUBY\n6. HTML"
read language
if [ $language = 1 ]
then
	echo "You chose C.\nEnter file name:"
	read filename
	touch ../$project/Makefile
	mkdir ../$project/srcs
	mkdir ../$project/includes
	git_ignore
	if [ -z $filename ]
	then
		echo $noinput
		touch ../$project/srcs/$project.c
	else
		touch ../$project/srcs/$filename.c
	fi
	echo "Do you want to use libft? [y / n]"
	read yn
	if [ $yn = "y" ] || [ $yn = "Y" ]
	then
		cp -R libft ../$project/libft
	elif [ $yn != "n" ] && [ $yn != "N" ]
	then
		echo "I didn't understand that.. I'll just assume \"no\""
	fi
elif [ $language = 2 ]
then
	echo "You chose C++.\nEnter file name:"
	read filename
	git_ignore
	if [ -z $filename ]
	then
		echo $noinput
		touch ../$project/$project.cpp
	else
		touch ../$project/$filename.cpp
	fi
elif [ $language = 3 ]
then
	echo "You chose SHELL.\nEnter file name:"
	read filename
	git_ignore
	if [ -z $filename ]
	then
		echo $noinput
		touch ../$project/$project.sh
	else
		touch ../$project/$filename.sh
	fi
elif [ $language = 4 ]
then
	echo "You chose PYTHON.\nEnter file name:"
	read filename
	git_ignore
	if [ -z $filename ]
	then
		echo $noinput
		touch ../$project/$project.py
	else
		touch ../$project/$filename.py
	fi
elif [ $language = 5 ]
then
	echo "You chose RUBY.\nEnter file name:"
	read filename
	git_ignore
	if [ -z $filename ]
	then
		echo $noinput
		touch ../$project/$project.rb
	else
		touch ../$project/$filename.rb
	fi
elif [ $language = 6 ]
then
	echo "You chose HTML.\nEnter file name:"
	read filename
	git_ignore
	if [ -z $filename ]
	then
		echo $noinput
		touch ../$project/$project.html
		echo $html_init >> ../$project/$project.html
	else
		touch ../$project/$filename.html
		echo $html_init >> ../$project/$filename.html
	fi
else
	echo "Not a valid number"
	rmdir ../$project
fi
