#!/bin/bash

# Start the bash interaction
echo -e "\e[91m1) Create a new repository at www.github.com\e[0m"
echo ""

# Clone the repository
echo -e "\e[91m2) Clone the new repository locally: paste here the repository's link\e[0m"
read url_repository
cd /home/$USER/github
git clone $url_repository
echo ""

# Set the github url of the  origin
echo -e "\e[91m3) Set the url of 'origin' repository\e[0m"
echo -e "\e[91m   Type your github username:\e[0m"
read github_user
echo -e "\e[91m   Type the github repository name (without the .git extension):\e[0m"
read github_repository_name
cd $github_repository_name
git remote set-url origin git@github.com:$github_user/$github_repository_name.git
echo ""

# Config the branches
git checkout main
git checkout -m master
git push origin -u master
git push origin --delete main
git checkout -b develop
git checkout -b feature
git checkout master

# Insert standard .gitignore file
echo ".pyc
.*
/*_venv/" > .gitignore
echo -e "\e[91m4) Created standard .gitignore\e[0m"
echo ""

# Setup python venv and install django
echo -e "\e[91m5) Python Venv and Django\e[0m"
while true; do
    read -p "Do you wish to setup python venv with django installed?" yn
    case $yn in
        [Yy]* ) pip install venv;python3 -m venv django_venv;source django_venv/bin/activate;pip install django;break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done


# execute this script in the current shell rather than subshell
$SHELL
