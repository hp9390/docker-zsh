function gitignore() { curl -L -s https://www.gitignore.io/api/\$@ ; }
alias updateTime='sudo ntpdate -u pool.ntp.org 24.56.178.140 2607:f248::45'
alias upd='updateTime && sudo apt-get autoremove -y && sudo apt-get clean && sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y'
alias add='sudo apt-get install -y'
