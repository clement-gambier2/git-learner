# function to print a message in the specified color
print_message() {
  # set the color variables
  red="\033[31m"
  green="\033[32m"
  blue="\033[34m"
  purple="\033[35m"

  # set the variable to reset the color
  reset="\033[0m"

  # get the arguments
  color="$1"
  text="$2"
  # print the message in the specified color
  echo -e "${color}${text}${reset}"
}