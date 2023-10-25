#!/bin/bash

# Define an array of menu options
options=("Option 1" "Option 2" "Option 3" "Quit")

# Initialize the selected option index
selected=1

# Function to clear the screen
clear_screen() {
    clear
}

# Function to display the menu
display_menu() {
    clear_screen
    echo "Select an option:"
    for i in "${!options[@]}"; do
        if [ $i -eq $selected ]; then
            echo " > ${options[$i]}"
        else
            echo "   ${options[$i]}"
        fi
    done
}

# Function to handle user input
handle_input() {
    read -rsn1 input
    case $input in
        "A") # Up arrow key
            ((selected--))
            [ $selected -lt 0 ] && selected=$(( ${#options[@]} - 1 ))
            ;;
        "B") # Down arrow key
            ((selected++))
            [ $selected -ge ${#options[@]} ] && selected=0
            ;;
        "") # Enter key
            clear_screen
            if [ $selected -eq $(( ${#options[@]} - 1 )) ]; then
                echo "Quitting..."
                exit 0
            else
                echo "You selected: ${options[$selected]}"
                # Add your logic here for what to do with the selected option
                read -p "Press Enter to continue..."
            fi
            ;;
    esac
}

# Main loop
while true; do
    display_menu
    handle_input
done
