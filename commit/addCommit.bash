#!/bin/bash

# Define ANSI color codes for text formatting
RED="\033[91m"    # Red color
GREEN="\033[32m"  # Green color
CYAN="\033[36m"   # Cyan color
RESET="\033[0m"   # Reset color

# Function to display a section header
section_header() {
    echo -e "${GREEN}$1${RESET}"
}
section_invalid() {
    echo -e "${RED}$1${RESET}"
}
section_info() {
    echo -e "${CYAN}$1${RESET}"
}
# Function to prompt the user for 'yes' or 'no'
prompt_yes_no() {
    while true; do
        read -p "$1(yes/no): " response
        if [ "$response" = "yes" ]; then
            echo "Great!"
            break
        elif [ "$response" = "no" ]; then
            echo "Okay."
            break
        else
            section_invalid "Invalid response. Please answer 'yes' or 'no'."
        fi
    done
}

# Function to check and explain a command with a limited number of attempts
check_and_explain_command() {
    correct_command="$1"
    explanation="$2"
    max_attempts=3

    for ((attempts = 1; attempts <= max_attempts; attempts++)); do
        read -p "Enter the command: " response

        if [ "$response" = "$correct_command" ]; then
            echo "Great! $explanation"
            break
            break
        elif [ "$response" = "no" ]; then
            echo "Oh... let's try again ?"
            break
        else
            if [ $attempts -ge $max_attempts ]; then
                section_invalid "Sorry, you've reached the maximum number of attempts. The correct command is: '$correct_command'."
                break
            else
                section_invalid "Invalid command. You need to use: $correct_command."
            fi
        fi
    done
}

section_header "In this part, we will explain the principles of 'git status', 'git add', and 'git commit'."

while true; do
    section_header "First, let's explain how the 'git status' command works."
    section_header  "Ok so 'git status' is a Git command used to display the current status of your working directory with respect to the Git repository. (named 'repo-git')"
    section_header "It provides information about which files have been modified, which files are staged for the next commit, and which files are untracked."
    prompt_yes_no "Are you ready?"

    if [ "$response" = "yes" ]; then
        break
    fi
done


check_and_explain_command "git status repo-git" "Now let's do the same thing for 'git add'."
clear 

while true; do

    section_header "Ok, now you're going to modify the file, you can write whatever you want, but you have to write something !"
    read -p "Enter text to add to README.md: " user_input
    section_info "$user_input" >> ./commit/README.md

    section_header "The text has been added to README.md."
    cat ./commit/README.md
    section_header "Now i will explain how git add works !"
    section_header "The git add command is used in Git to stage changes in your working directory for inclusion in the next commit."
    section_header "It's an essential step in the Git workflow, allowing you to select which changes you want to include in a commit and which ones you want to exclude."
    prompt_yes_no "Are you ready?"

    if [ "$response" = "yes" ]; then
        break
    fi
done
clear

while true; do

    section_header "Now you have to use the 'git add' command to add the changes you made to the file to the staging area."
    section_header "It allows you to select specific changes and files to include in the upcoming commit while leaving other changes untouched."
    section_header "'git add' is a Git command used to stage changes in your working directory for the next commit."
    if [ "$response" = "yes" ]; then
        break
    fi
done
check_and_explain_command "git add README.md" "Now let's do the same thing for 'git commit'."
section_header "Great, ok now you add the modification to the staging area, now you have to commit it."

while true; do
    section_header "Now let's explain how the 'git commit' command works."
    section_header "The git commit command is used to create a new snapshot of the changes you have staged using the git add command."
    section_header "Each commit represents a specific point in the project's history and includes a message that describes the changes made in that commit."
    prompt_yes_no "Are you ready?"

    if [ "$response" = "yes" ]; then
        break
    fi
done

check_and_explain_command "git commit -m 'Your commit message'" "That's it for 'git commit'."

./branch/branchLesson.bash