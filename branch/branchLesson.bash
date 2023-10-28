#!/bin/bash
BRANCH_EMOJI="🌿"
MERGE_EMOJI="🔄"
FEATURE_EMOJI="🚀"

# Define colors
BLUE="\033[1;34m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
PURPLE="\033[1;35m"
CYAN="\033[1;36m"
NC="\033[0m"

state=1
is_quitting=0

while [ $is_quitting -eq 0 ]; do
  clear

  case "$state" in
    1)
      echo -e "${BLUE}${BRANCH_EMOJI} Git Branch ${BRANCH_EMOJI}${NC}"
      echo -e "${GREEN}What Is a Branch? ${NC}"
      echo -e "In Git, a branch is essentially a separate line of development."
      echo -e "It allows you to work on different versions of your code simultaneously without affecting the main codebase."
      echo -e "This is particularly useful when you want to experiment with new features or make changes to your code without affecting the main codebase."
      echo -e "${PURPLE}Press → to continue ${NC}"
      ;;

    2)
      echo -e "${BLUE}${BRANCH_EMOJI} Git Branch ${BRANCH_EMOJI}${NC}"
      echo -e "${GREEN}How Does It Work? ${NC}"
      echo -e "When you create a branch, you essentially create a copy of the codebase at that point in time."
      echo -e "You can then make changes to the code in that branch without affecting the main codebase."
      echo -e "Once you're happy with the changes you've made, you can merge the branch back into the main codebase."
      echo -e "Git branches are incredibly powerful and allow developers to work on multiple features or bug fixes simultaneously."
      echo -e "They also make it easy to experiment with new ideas without affecting the main codebase."
      echo -e "${PURPLE}Press ← to go back or → to continue ${NC}"
      ;;

    3)
      echo -e "${BLUE}${BRANCH_EMOJI} Git Branch ${BRANCH_EMOJI}${NC}"
      echo -e "${GREEN}How to create a branch? ${NC}"
      echo -e "In Git, branches are like parallel universes for your project. Each branch represents a different path your project can take."
      echo -e "Imagine them as different storylines in a book, each with its own characters and plot twists."
      echo -e "To create a new branch, you can use the following command:"
      echo -e "${YELLOW}git branch new-branch-name${NC}"
      echo -e "To create a new branch, and switch directly on it : "
      echo -e "${YELLOW}git checkout -b new-branch-name${NC}"
      echo -e "This command creates a new branch (a new storyline) and switches to it, so you can make changes without affecting the main story (the 'main' branch)."
      echo -e "${PURPLE}Press ← to go back or → to continue ${NC}"
      ;;

    4)
      echo -e "${BLUE}${BRANCH_EMOJI} Git Branch ${BRANCH_EMOJI}${NC}"
      echo -e "${GREEN}${MERGE_EMOJI} Merging Branches ${MERGE_EMOJI}${NC}"
      echo -e "When you're happy with a branch's storyline, you can merge it back into the main story (the 'main' branch) using the 'git merge' command:"
      echo -e "${YELLOW}git checkout master"
      echo -e "git merge your-branch-name${NC}"
      echo -e "This combines the changes from your branch into the main story, and the book gets a new chapter."
      echo -e "${GREEN}   o"
      echo -e "  /|\\"
      echo -e " o o o${NC}"
      echo -e " | | |"
      echo -e "${CYAN} main feature bug-fix${NC}"
      echo -e "${PURPLE}Press ← to go back or → to take the test ${NC}"
      ;;

  esac

  read -rsn1 input
  case "$input" in
    "C") # Right arrow or 'C' key
      if [ $state -lt 4 ]; then
        ((state++))
      fi
      # If we're on the last state, go to the test
      if [ $state -eq 4 ]; then
        clear
        is_quitting=1
        ./branch/branchMcq.bash
      fi
      ;;

    "D") # Left arrow or 'D' key
      if [ $state -gt 1 ]; then
        ((state--))
      fi
      ;;

    "Q") # 'Q' key for quitting
      exit
      ;;
  esac
done
