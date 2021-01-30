#!/bin/bash

# Start the bash interaction and setup the new project folder
echo -e "\e[91mType the new project name:\e[0m"
read project_name_typed
project_name=$project_name_typed
project_path=/home/$USER/github/$project_name
echo ""
mkdir -p $project_path
cd $project_path
pwd
echo -e e "\e[91mNew project folder created at $project_path\e[0m"

# Git init oif the new project folder
#git config --global init.defaultBranch main
git init 

# Insert standard .gitignore file
echo ".pyc
.*
/*_venv/" > .gitignore
echo -e "\e[91mCreated standard .gitignore\e[0m"
echo ""
echo "# Django startproject automator

Arawindor's Django create project has set up local paht, Git, GitHub connection, Python Venv and Django installation." > README.md
git add .
git commit -m "First commit"
echo ""

# Create a brand new GitHub.com repository
echo -e "\e[91m---> Create a new repository at www.github.com and call it $project_name\e[0m"
echo ""

# Setup the github.com repository
echo -e "\e[91mSetup the origin repository\e[0m"
echo ""
echo -e "\e[41m   Type the GitHub.com repository link:\e[0m"
read github_repository_link
github=$github_repository_link
github_user_repo=$(echo $github | grep -oP '(?<=github.com/).*?(?=.git)')
git remote add origin $github
git remote -v
echo $github_user_repo

# Setup the SSH/GPG keys
echo -e "\e[91mGitHub login and SSH/GPG keys\e[0m"
echo ""
while true; do
    read -p "Do you have a SSH key associated with your github.com account?	[yes/no] " yn
    case $yn in
        [Yy]* ) git remote set-url origin git@github.com:$github_user_repo.git;break;;
        [Nn]* ) echo -e "\e[41m   Enter your GitHub username and password below\e[0m";break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Setup the branch tree
git branch -M main
git push -u origin main
git checkout -b develop
git push -u origin develop
git checkout -b feature
git push -u origin feature
git checkout main
echo ""

# Setup Python-venv and install Django
echo -e "\e[91mPython Venv and Django\e[0m"
while true; do
    read -p "Do you wish to setup Python Venv and install Django into the new venv? [yes/no] " yn
    case $yn in
        [Yy]* ) python3 -m venv django_venv;source django_venv/bin/activate;pip install django;django-admin startproject $project_name;deactivate;break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Final setup commit
git add .
git commit -m "Django startproject"
git push

# Exit message
echo ""
echo -e "\e[91mConfiguration completed\e[0m"
