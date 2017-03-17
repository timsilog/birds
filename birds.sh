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
	echo "Enter file name:"
	read filename
	if [ 
	touch ../$project/Makefile
	mkdir ../$project/srcs
	touch ../$project/srcs/$filename.c
	mkdir ../$project/includes
	git_ignore
	echo "Do you want libft? [y / n]"
	read yn
	if [ $yn = "y" ] || [ $yn = "Y" ]
	then
		cp -R libft ../$project/libft
	elif [ $yn != "n" ] && [ $yn != "N" ]
	then
		echo "I didn't understand that.. I'll just assume \"no\""
	fi
else
	echo "good job"
fi


