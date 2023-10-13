#!/bin/bash

# Colors for text formatting
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function for practical Git questions
git_exercise() {
    local user_response=""

    echo -e "${GREEN}Git Practical Exercise:${NC}"
    
    # Question 1: Create a new branch
    echo -e "${PURPLE}Question 1: Create a new branch named 'my-new-branch' from the 'master' branch.${NC}"
    read -p "Enter the Git command to create the new branch: " user_response
    if [[ "$user_response" == "git branch my-new-branch" ]]; then
        echo -e "${GREEN}Correct answer!${NC}"
    else
        echo -e "${RED}Incorrect response. The correct command is 'git branch my-new-branch'.${NC}"
    fi
    
    # Question 2: Switch to the new branch
    echo -e "${PURPLE}Question 2: Switch to the new branch 'my-new-branch'.${NC}"
    read -p "Enter the Git command to switch to the branch: " user_response
    if [[ "$user_response" == "git checkout my-new-branch" ]]; then
        echo -e "${GREEN}Correct answer!${NC}"
    else
        echo -e "${RED}Incorrect response. The correct command is 'git checkout my-new-branch'.${NC}"
    fi
}

# Call the Git exercise function
git_exercise
