#$1 = question
#$2 = answers
#$3 = correct answer index
mcq() {
    local question="$1"
    local -a options=("${!2}")
    local correct="$3"
    local option_index=0
    local has_answered=0
    while [ $has_answered != 1 ]; do
        clear
        echo -e "${BLUE}${QUESTION_EMOJI} ${question}${QUESTION_EMOJI}${NC}"
        for i in "${!options[@]}"; do
            if [ $i -eq $option_index ]; then
                echo -e "${PURPLE}➤ ${options[$i]}${NC}"
            else
                echo -e "${GREEN}  ${options[$i]}${NC}"
            fi
        done

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
                if [[ "$option_index" == "$correct" ]]; then
                    echo -e "${ANSWER_EMOJI} Correct Answer: ${GREEN}${options[$correct]}${NC}"
                else
                    echo -e "${INCORRECT_ANSWER_EMOJI} Incorrect Answer. Here is the right one : ${GREEN}${options[$correct]}${NC}"
                fi
                has_answered=1
                read -p $'\e[0;35m Press enter to continue...\e[0m '
                clear
            ;;
        esac
    done
}