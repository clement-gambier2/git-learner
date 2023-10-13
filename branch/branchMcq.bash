#!/bin/bash
QUESTION_EMOJI="❓"
ANSWER_EMOJI="✅"
INCORRECT_ANSWER_EMOJI="❌"

source ./utils/mcq.bash

question="Question 1: What is a Git branch?"
options=("A. A physical device used to connect to a computer." "B. A parallel line of development in a Git repository." "C. A software tool for designing graphics.")
correct=1
mcq "${question}" "options[@]" "${correct}"
clear

question="Question 2: How do you create a new branch in Git?"
options=("A. git clone command" "B. git branch command" "C. git checkout command")
correct=1
mcq "${question}" "options[@]" "${correct}"
clear

question="Question 3: What is the purpose of merging Git branches?"
options=("A. To create a conflict in the repository." "B. To combine the changes from one branch into another." "C. To delete a branch.")
correct=1
mcq "${question}" "options[@]" "${correct}"


read -p $'\e[0;35m      Press enter to continue...\e[0m '
clear
./branch/branchLab.bash
