# Start project automator v 0.1

This script provide a full configurator for your own brand new projects.

Git and GitHub and other specific configurations are included.

## Django startproject automator
The "new_django.sh" script configures a Git local path, a GitHub connection, configures the main branches and provides Python Venv, Django installation and Django startproject (django-admin startproject) if required.

    # Clone the repository
    ~$ git clone git@github.com:Arawindor/create_project.git
    # Select the local repository path
    ~$ cd create_project
    # Give the execution privilege to the script
    ~/create_project/$ chmod +x new_django.sh
    # Run the automator
    ~/create_project/$ ./new_django.sh
