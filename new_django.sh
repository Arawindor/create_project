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
echo "New project folder created at $project_path"

# Git init oif the new project folder
git config --global init.defaultBranch main
git init 

# Insert standard .gitignore file
echo ".pyc
.*
/*_venv/" > .gitignore
echo -e "\e[91mCreated standard .gitignore\e[0m"
echo ""
git add .
git commit -m "First commit"
echo ""

# Create a brand new GitHub.com repository
echo -e "\e[91m---> Create a new repository at www.github.com and call it $projectname\e[0m"
echo ""

# Setup the github.com repository
echo -e "\e[91mSetting the url of 'origin' repository\e[0m"
echo ""
echo -e "\e[41m   Type the GitHub.com repository link:\e[0m"
read github_repository_link
github=$github_repository_link
git remote add origin $github
git remote -v

# Setup the SSH/GPG keys
echo -e "\e[91mGitHub login and SSH/GPG keys\e[0m"
echo ""
while true; do
    read -p "Do you have a SSH key associated with your github.com account?	[yes/no] " yn
    case $yn in
        [Yy]* ) echo -e "\e[41m   Enter the GitHub 'username/repositoryname' of the repository, mind that is case sensitive and you must enter the '/' also! (eg: for https://github.com/Arawindor/create_project.git type 'Arawindor/create_project')\e[0m";read github_user_repo;git remote set-url origin git@github.com:$github_user_repo.git;break;;
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
        [Yy]* ) python3 -m venv django_venv;source django_venv/bin/activate;pip install django;deactivate;break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Exit message
echo ""
echo -e "\e[91mConfiguration completed\e[0m"
