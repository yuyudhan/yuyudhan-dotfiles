#!/bin/zsh
#

#!/bin/bash

text=$(cat << 'EOF'
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀        ⠀⢰⠁⠀⣿⠀⠸⡀⠀⠀⠀⠀⡀⣼⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀       ⢠⡇⠀⣿⣿⣶⠀⢹⡀⠀⣀⣀⣸⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠉⠻⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀        ⠘⢧⣾⣿⣿⣧⣤⡼⠁⠀⢻⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠙⢿⣄⡀⣠⣾⠿⠋⠻⣿⣿⣿⣆⠀⠀⠀        ⠀⠀⠿⣿⣿⣿⠃⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀
 ⠀⢠⣿⣿⣿⣿⡿⠟⠛⠉⠉⠉⠙⢧⡀⠈⠉⠉⠀⠀⠀⣠⣽⣿⣿⣿⣧⠀⠀        ⠀⠀⠀⣿⣿⣿⠀⠀⠀⢀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣇⡀⠀⠀⠀⠀⠀
 ⢀⣿⣿⣿⣿⣿⣄⠀⠀⢀⣀⣀⡀⠀⢻⣷⣶⡶⠖⠒⠛⠿⣿⣿⣿⣿⣿⣇⠀        ⠀⠀⠀⡿⣿⣿⣶⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀
 ⣸⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⠟⢀⣾⣿⠟⠀⠀⢀⣤⣤⡈⢻⣿⣿⣿⣿⡀       ⠀⠀⠀ ⡆⣿⢻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀
 ⣿⣿⣿⣿⣿⣿⣿⣿⣯⠛⠛⠉⣠⣾⣿⡟⠀⠀⣠⣿⣿⣿⣿⠘⣿⣿⣿⣿⡇       ⠀⠀⠀ ⡇⣿⢰⠀⠀⠉⠁⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⠀⠀
 ⣿⣿⣿⣿⢹⣿⣿⣿⣿⣆⠀⠀⠉⠉⢉⣀⣀⣠⣿⣿⣿⣿⣿⠀⢿⣿⣿⣿⡇       ⠀⠀⠀ ⡇⣿⢸⠀⠀⠀⢰⢷⢸⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⠀⠀
 ⢸⣿⣿⣿⡈⢿⣿⣿⣿⣿⣿⣿⣷⡀⠈⣿⡟⣿⣿⣿⣿⡿⠃⠀⣿⣿⣿⣿⠀       ⠀⠀⠀ ⡇⡏⢸⠀⠀⠀⠀⢹⢸⣿⣿⣿⣿⣿⣿⣿⣿⣧⠙⣿⣿⣧⠀
 ⠀⢿⣿⣿⣧⠈⠻⣿⣿⣿⣿⣿⡿⠃⠀⣿⣇⠈⠉⠉⠉⠀⠀⢰⣿⣿⣿⠇⠀       ⠀⠀⠀ ⡃⡇⢸⠀⠀⠀⠀⠠⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⢻⣿⣿⠀
 ⠀⠈⢿⣿⣿⣧⡀⠀⠉⠉⠉⠉⠀⠀⢠⣿⣿⣦⣀⠀⠀⣀⣴⣿⣿⣿⠏⠀⠀       ⠀⠀⠀ ⢠⡇⠸⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡌⣿⣿⡇
 ⠀⠀⠀⠻⣿⣿⣿⣦⣄⣀⣀⣀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀       ⠀⠀⠀ ⢼⡇⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠈⣿⡇
 ⠀⠀⠀⠀⠈⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀       ⠀⠀⠀ ⢾⡇⠀⡆⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣟
 ⠀⠀⠀⠀⠀⠀⠀⠉⠛⠻⠿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀ ⠌⡇⠀⡇⠀⠀⠸⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⡿
                                      ⠀⠀ ⢸⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀
                                      ⠀⠀ ⢸⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠻⠇⠀
                                      ⠀⠀ ⢸⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀
                                      ⠀⠀ ⢸⡇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠿⠻⢿⣿⣿⣷⠀⠀⠀⠀
                                      ⠀⠀ ⢸⠃⠀⠀⠀⠀⠀⣿⣿⣿⣿⠛⠁⠀⠀⠀⣻⣿⣿⡆⠀⠀⠀
                                      ⠀⠀ ⢸⠀⠀⠀⠀⠀⠈⢹⣿⣿⡟⠀⠀⠀⠀⠀⠘⣿⣿⡇⠀⠀⠀
                                      ⠀⠀ ⢸⠀⠀⠀⠀⠀⠀⠰⣿⣿⠃⠀⠀⠀⠀⠀⠀⢻⣿⡇⠀⠀⠀
EOF
)

echo "$text"

# echo -e "\033[0m"
# echo -e "                                                          "
# echo -e "\033[38;5;51m███╗   ███╗\033[38;5;45m █████╗ \033[38;5;39m██╗  ██╗\033[38;5;33m █████╗ \033[38;5;27m██████╗ \033[38;5;21m███████╗\033[38;5;20m██╗   ██╗"
# echo -e "\033[38;5;51m████╗ ████║\033[38;5;45m██╔══██╗\033[38;5;39m██║  ██║\033[38;5;33m██╔══██╗\033[38;5;27m██╔══██╗\033[38;5;21m██╔════╝\033[38;5;20m██║   ██║"
# echo -e "\033[38;5;51m██╔████╔██║\033[38;5;45m███████║\033[38;5;39m███████║\033[38;5;33m███████║\033[38;5;27m██║  ██║\033[38;5;21m█████╗  \033[38;5;20m██║   ██║"
# echo -e "\033[38;5;51m██║╚██╔╝██║\033[38;5;45m██╔══██║\033[38;5;39m██╔══██║\033[38;5;33m██╔══██║\033[38;5;27m██║  ██║\033[38;5;21m██╔══╝  \033[38;5;20m╚██╗ ██╔╝"
# echo -e "\033[38;5;51m██║ ╚═╝ ██║\033[38;5;45m██║  ██║\033[38;5;39m██║  ██║\033[38;5;33m██║  ██║\033[38;5;27m██████╔╝\033[38;5;21m███████╗\033[38;5;20m ╚████╔╝"
# echo -e "\033[38;5;51m╚═╝     ╚═╝\033[38;5;45m╚═╝  ╚═╝\033[38;5;39m╚═╝  ╚═╝\033[38;5;33m╚═╝  ╚═╝\033[38;5;27m╚═════╝ \033[38;5;21m╚══════╝\033[38;5;20m  ╚═══╝"
# echo -e "\033[0m"
#

