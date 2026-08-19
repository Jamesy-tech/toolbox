#!/bin/bash

options=("Bash" "Windows CMD" "Windows PowerShell" "Zsh" "btop" "Exit")
selected=0

bash_environment() {
clear
echo "Bash $BASH_VERSION"
exit 0
}

windows_cmd_environment() {
clear
wine cmd
exit 0
}

powershell_environment() {
clear

if command -v pwsh >/dev/null 2>&1; then
pwsh
elif command -v powershell >/dev/null 2>&1; then
powershell
else
echo "PowerShell is not installed."
echo "Press Enter to exit."
read -r
fi

exit 0
}

zsh_environment() {
clear
zsh -c 'echo "Zsh $ZSH_VERSION"; exec zsh'
exit 0
}

btop_environment() {
clear
btop
exit 0
}

while true; do
clear

echo "=========================="
echo "    Select Environment"
echo "=========================="
echo

for i in "${!options[@]}"; do
if [ "$i" -eq "$selected" ]; then
echo "> ${options[$i]}"
else
echo "  ${options[$i]}"
fi
done

echo
echo "Use ↑ ↓ to select, Enter to confirm"
echo "Ctrl+C to exit"

read -rsn1 key

if [[ $key == $'\x03' ]]; then
# Ctrl+C
clear
exit 0

elif [[ $key == $'\x1b' ]]; then
read -rsn2 key

case "$key" in
    "[A") ((selected--)) ;;
    "[B") ((selected++)) ;;
esac

if [ "$selected" -lt 0 ]; then
    selected=$((${#options[@]} - 1))
fi

if [ "$selected" -ge "${#options[@]}" ]; then
    selected=0
fi

elif [[ $key == "" ]]; then
case $selected in
0)
bash_environment
;;
1)
windows_cmd_environment
;;
2)
powershell_environment
;;
3)
zsh_environment
;;
4)
btop_environment
;;
5)
clear
exit 0
;;
esac
fi

done
