# Example

![bash dev prompt example](https://raw.githubusercontent.com/tarach/bash-dev-prompt/master/example.jpg)

# Install
* ```mkdir ~/inc```
* ```wget https://raw.githubusercontent.com/tarach/bash-dev-prompt/master/prompt.sh > ~/inc/prompt.sh```
* Edit your .bashrc ```nano ~/.bashrc``` and add 2 lines after PS1 declaration ( prompt variable )
```bash
source ~/inc/prompt.sh
exportPrompt
```
Open new terminal or reinclude your ```.bashrc```
* ```source ~/.bashrc```

How it looks in my ```.bashrc```
```bash
# phpbrew - pvm - php version manager
export PHPBREW_SET_PROMPT=0
export PHPBREW_RC_ENABLE=1
source ~/.phpbrew/bashrc

# nvm - node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ./inc/dev-prompt.sh
exportPrompt
```
