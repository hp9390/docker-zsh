function gitignore() { curl -L -s https://www.gitignore.io/api/\$@ ; }
alias updateTime='ntpdate -u pool.ntp.org 24.56.178.140 2607:f248::45'
alias upd='updateTime && apt-get autoremove -y && apt-get clean && apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y'
alias add=' apt-get install -y'
