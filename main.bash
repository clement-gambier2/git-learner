#!/bin/bash
# Set colors
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export NC='\033[0m' # No Color

./utils/printingLogo.bash
clear

# Define the menu options
options=("Start" "Credit" "Quit")

# Set the default option
option_index=0
is_quitting=0

# Print the menu
while [ $is_quitting != 1 ]; do
    clear
    echo -e "${BLUE}Please select an option:${NC}"
    for i in "${!options[@]}"; do
        if [ $i -eq $option_index ]; then
            echo -e "${PURPLE}➤ ${options[$i]}${NC}"
        else
            echo -e "${GREEN}  ${options[$i]}${NC}"
        fi
    done

    # Get the user's input with timeout
    read -rsn1 input
    case "$input" in
        "A") # Up arrow
            if [ $option_index -gt 0 ]; then
                ((option_index--))
            fi
            ;;
        "B") # Down arrow
            if [ $option_index -lt $((${#options[@]} - 1)) ]; then
                ((option_index++))
            fi
            ;;
        "") # Enter key
            case $option_index in
                0) # Start
                    clear
                    ./commit/addCommit.bash
                    ;;
                1) # Credit
                    clear
                    ./credit.bash
                    ;;
                2) # Quit
                    clear
                    is_quitting=1
                    ;;
            esac
        ;;
    esac
done
