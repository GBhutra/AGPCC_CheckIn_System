<<<<<<< HEAD
#local variables
bold=$(tput bold)
normal=$(tput sgr0)
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
BLUE='\033[1;34m'
BLOCK_BLUE='\e[44m'
BLOCK_NORMAL='\e[49m'
#Header
printf "%b" "\n${BLOCK_BLUE}                    --- REMEMBER SID :P :)  ---        ${BLOCK_NORMAL}\n"
=======
>>>>>>> 78de75e3979ac1a7d655e65174538e04caa192c7
bundle install
sudo service postgresql restart
rake db:reset
rake db:migrate
rake db:seed
