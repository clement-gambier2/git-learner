#!/bin/bash


source ./utils/colorText.sh
YELLOW='\033[0;33m'
RESET='\033[0m'

presentation_init_command() {
    clear
    echo "Git is a version control system that allows you to track changes to your code over time."
    echo "A Git repository is a directory that contains all of the files and metadata that Git uses to keep track of changes to your code." 
    echo "When you initialize a directory as a Git repository, Git creates a hidden directory called ".git" that contains all of the information Git needs to manage your code."
    echo "You can use Git to commit changes to your code, create branches to work on different versions of your code, and collaborate with other developers on your codebase."
    print_message "green" "First of all, we'll look at how to create a repository"
    
    read -p $'\e[0;35m      Press enter to continue...\e[0m '
    clear

    print_message "blue" "Presentation of the git init command"
    echo "The git init command is used to initialize a new Git repository in a directory."
    echo "When you run this command, Git sets up all the necessary files and data structures to start tracking changes in your project files."
    print_message "green" "Now, let's create your first repository..."

    read -p $'\e[0;35m      Press enter to continue...\e[0m '
    clear
}

init_repo_files() {
    
    # Prompt the user for a description of the repository.
    echo -e "${YELLOW}"
    read -p "Enter a description for the repository: " repo_description
    echo -e "${RESET}"

    mkdir $repo_name

    # Initialize the directory as a Git repository.
    cd $repo_name

    # Create a README.md file in the repository directory with the description.
    echo "# $repo_name" > README.md
    echo $repo_description >> README.md

    # Create a .gitignore file in the repository directory.
    touch .gitignore

    echo "The $repo_name repository has been successfully created on Git."
}

check_command_init(){
    is_false=true;
    while $is_false; do
    
        echo -e "${YELLOW}"
        read -p "Give me the correct command to create the repository in github: " command_init
        echo -e "${RESET}"

        # Check that the answer is valid
        if [[ "$command_init" == "git init $repo_name" ]]; then
            is_false=false
        else
            print_error "Invalid answer, you need to use the git init command with the name of your folder"
        fi
    done
    clear
}

presentation_init_command

# Prompt the user for the name of the repository they want to create.
read -p "Enter the name of the repository you want to create: " repo_name

# Create a new directory with the name of the repository.
while [ -d "$repo_name" ]; do
    print_error "Error: A directory with the name '$repo_name' already exists."
    read -p "Enter a new name for the repository: " repo_name
done

check_command_init

echo "Well done! You wrote the correct command."
echo "To finish creating your repository, add a description to your repository."
echo "This description will appear in your README.md"

init_repo_files

# redirect to the next part
read -p $'\e[0;35m      Press enter to continue...\e[0m '
clear
../commit/addCommit.bash
