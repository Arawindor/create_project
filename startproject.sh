#!/bin/bash

echo -e "\e[91m1) Create a new repository at www.github.com\e[0m"
echo ""
echo -e "\e[91m2) Clone the new repository locally: paste here the repository's link\e[0m"
read url_repository
cd /home/$USER/github
git clone $url_repository
echo ""
echo -e "\e[91m3) Set the url of 'origin' repository\e[0m"
echo -e "\e[91m   Type your github username:\e[0m"
read github_user
echo -e "\e[91m   Type the github repository name (without the .git extension):\e[0m"
read github_repository_name
cd $github_repository_name
git remote set-url origin git@github.com:$github_user/$github_repository_name.git
echo ""


# execute this script in the current shell rather than subshell
$SHELL
