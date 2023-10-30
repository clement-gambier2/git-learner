#!/bin/bash

# Define ANSI color codes for text formatting
RED="\033[91m"    # Red color
GREEN="\033[32m"  # Green color
CYAN="\033[36m"   # Cyan color
RESET="\033[0m"   # Reset color

BRANCH_EMOJI="🌿"
INFO_EMOJI="💡"
COMMAND_EMOJI="🚀"
CHECK_EMOJI="✅"
INVALID_EMOJI="❌"

section_headline() {
    echo -e "${CYAN}${BRANCH_EMOJI}$1${BRANCH_EMOJI}${RESET}"
}

section_header() {
    echo -e "${GREEN}$1${RESET}"
}

section_info() {
    echo -e "${CYAN}$1${RESET}"
}

section_invalid() {
    echo -e "${RED}$1${RESET}"
}

# Function to prompt the user for 'yes' or 'no'
prompt_yes_no() {
    while true; do
        read -p "$1 (yes/no): " response
        if [ "$response" = "yes" ]; then
            echo -e "${CHECK_EMOJI} Great!${RESET}"
            break
        elif [ "$response" = "no" ]; then
            echo -e "Okay."
            break
        else
            section_invalid "${INVALID_EMOJI} Invalid response. Please answer 'yes' or 'no'."
        fi
    done
    sleep 2
}

# Function to check and explain a command with a limited number of attempts
check_and_explain_command() {
    correct_command="$1"
    explanation="$2"
    max_attempts=3

    for ((attempts = 1; attempts <= max_attempts; attempts++)); do
        read -p "Enter the command: " response

        if [[ "$response" == "$correct_command" ]]; then
            echo -e "${CHECK_EMOJI} Great! $explanation${RESET}"
            break
        elif [[ "$response" == "no" ]]; then
            echo -e "Oh... let's try again?"
            break
        else
            if [[ $attempts -ge $max_attempts ]]; then
                section_invalid "${INVALID_EMOJI} Sorry, you've reached the maximum number of attempts. The correct command is: '$correct_command'."
                break
            else
                section_invalid "${INVALID_EMOJI} Invalid command. You need to use: $correct_command."
            fi
        fi
    done
    sleep 2
}

# Initial section
section_headline "Git Basics"
section_header "In this part, we will explain the principles of 'git status', 'git add', and 'git commit'."

while true; do
    section_header "First, let's explain how the 'git status' command works."
    section_info "'git status' displays the current status of your working directory with respect to the Git repository."
    section_info "It provides information about modified files, files staged for the next commit, and untracked files."
    prompt_yes_no "Are you ready?"

    if [[ "$response" == "yes" ]]; then
        break
    fi
done
check_and_explain_command "git status" "Now let's do the same thing for 'git add'."
clear

while true; do

    section_header "Ok, now you're going to modify the file, you can write whatever you want, but you have to write something !"
    read -p "Enter text to add to README.md: " user_input
    # because earlier we cd into the repo, we need to cd back out
    cd ..
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
    section_header "The 'git add' command stages changes for the next commit."
    section_info "'git add' allows you to select which changes to include in the upcoming commit."
    section_info "You can use 'git add' to stage a file or a directory."
    section_info "Let's try to use git add to stage the README.md file."
    prompt_yes_no "Are you ready?"

    if [[ "$response" == "yes" ]]; then
        break
    fi
done
check_and_explain_command "git add README.md" "Now let's do the same thing for 'git commit'."
clear

section_header "Now you need to use the 'git commit' command to create a new snapshot of your changes."
while true; do
    section_header "Let's explain how the 'git commit' command works."
    section_info "'git commit' creates a new snapshot of the staged changes."
    section_info "Each commit represents a specific point in your project's history with a descriptive message."
    section_info "To add the necessary message to your commit, you have to use the '-m' option."
    section_info "Let's try to use git commit with the message 'My first commit'."
    prompt_yes_no "Are you ready?"

    if [[ "$response" == "yes" ]]; then
        break
    fi
done
check_and_explain_command "git commit -m 'My first commit'" "That's it for 'git commit'."

# Redirect to the next part
read -p $'\e[0;35mPress enter to continue...\e[0m '
clear
cd ..
./branch/branchLesson.bash
