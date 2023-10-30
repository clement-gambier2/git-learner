# function to print a message in the specified color
print_message() {
  # set the color variables
  red="\033[31m"
  green="\033[32m"
  yellow="\033[33m"
  blue="\033[34m"
  purple="\033[35m"

  # set the variable to reset the color
  reset="\033[0m"

  # get the arguments
  color="$1"
  text="$2"

  # print the message in the specified color
  case $color in
    "red")
      echo -e "${red}${text}${reset}"
      ;;
    "green")
      echo -e "${green}${text}${reset}"
      ;;
    "yellow")
      echo -e "${yellow}${text}${reset}"
      ;;
    "blue")
      echo -e "${blue}${text}${reset}"
      ;;
    "purple")
      echo -e "${purple}${text}${reset}"
      ;;
    *)
      echo "Invalid color"
      ;;
  esac
}

print_error() {
  red="\033[31m"
  reset="\033[0m"
  text=$1

  echo -e "${red}${text}${reset}"
}