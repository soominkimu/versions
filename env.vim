#########* AWS EC2 Ubuntu Instance Setup ##########[09/26/2017]
# At first, install iTerm2 - macOS Terminal Replacement from https://www.iterm2.com/
# For ubuntu, install terminator

https://console.aws.amazon.com/ec2/v2/home?region=us-east-1

# [Launch Instance] Ubuntu Server 16.04 LTS (HVM), SSD Volume Type - ami-cd0f5cb6
# t2.micro
# - Choose an existing key pair / BundyDr2017

# Security groups: 
# [Add Rule] Type: Custom TCP Rule, Protocol: TCP, Port Range: 3000, Source: Anywhere (0.0.0.0/0), Description: Web Dev Test

# Copy connect text
# ssh -i "BundyDr2017.pem" ubuntu@ec2-54-164-49-51.compute-1.amazonaws.com
# On the Mac's finder, press CMD+Shift+. to toggle hidden files
@local$ cd ~/z9; vim aws
@local$ sudo chmod x+ aws  # if it was not applied before, make it executable
@local$ . ./aws            # or source aws  # be sure to include path even in the same directory
ubuntu@ip-172-31-30-46:~$ uname -r
# 4.4.0-1022-aws
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get dist-upgrade
# $ sudo shutdown -r now

$ lsb_release -a   # check ubuntu version (LSB=Linux Standard Base)

########## Using SSH over HTTPS port 443 ##########
@local$ ssh -T git@ssh.github.com # If there's no response, default SSH port 22 is blocked in your network
# ssh: connect to host github.com port 22: Operation timed out
@local$ ssh -T -p 443 git@ssh.github.com # Test if there's any response
# [Add Rule] Type: HTTPS, Protocol: TCP, Port Range: 443, Source: Anywhere (0.0.0.0/0), Description: another SSH port 
# Now use any other hotspot to connect to the AWS server
@local$ nmap 127.0.0.1   ## or telnet localhost 22
$ sudo vim /etc/ssh/sshd_config
Port 443  # add under the line Port 22
$ sudo service sshd restart
$ sudo netstat -nlp | grep 443
# tcp        0      0 0.0.0.0:443             0.0.0.0:*               LISTEN      -
# tcp6       0      0 :::443                  :::*                    LISTEN      -
@local$ ssh -i "~/.ssh/BundyDr2017.pem" ubuntu@ec2-54-164-49-51.compute-1.amazonaws.com -p 443 # success! Sep.27,2017@smpl.org

########## Install Zsh & oh-my-zsh ##########
$ vim ~/.bashrc   # check the profile, *In Mac ~/.bash_profile
$ echo $SHELL
# /usr/bin/bash
$ sudo apt-get install zsh git-core
$ sudo wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh # Install Oh my zsh
$ sudo chsh -s `which zsh` # change shell
$ sudo cat /etc/passwd | grep -E "root|$USER"  # check if the path in passwd file changed for both 'root' and 'ubuntu'(user)
$ sudo chsh -s "$(command -v zsh)" "${USER}"
$ cat /etc/shells  # list of shells
# relogin

########## Install Powerline & fonts ##########
$ sudo apt install fontconfig
$ fc-cache —V  # check if fc-cache installed
# Don't need to install powerline (that depends on python). Install fonts only.
$ wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
$ wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
$ mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
$ fc-cache -vf ~/.fonts
$ mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
$ echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"	#  ±  ➦ ✘ ⚡ ⚙

$ vim ~/.zshrc
ZSH_THEME=“agnoster”
# To show the full path
$ vim ~/.oh-my-zsh/themes/agnoster.zsh-theme
/current working    # seach for "current working directory"
# change '%~' to '%d'
# relogin

########## Upgrade to Vim 8.0 & install tpope/vim-pathogen ##########
$ dpkg -s vim | grep 'Version'
$ sudo add-apt-repository ppa:jonathonf/vim  # to get the recent version of Vim 8.0
$ sudo apt update
$ apt list —upgradable
$ sudo apt upgrade

$ mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim # pathogen vim plugin install helper
# install syntax highlight plugins
$ git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript
$ git clone https://github.com/mxw/vim-jsx.git ~/.vim/bundle/vim-jsx
$ git clone https://github.com/elzr/vim-json.git ~/.vim/bundle/vim-json
# install fancy status line modifier with powerline
$ git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
$ git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim/bundle/vim-airline-themes
$ git clone git://github.com/tpope/vim-commentary.git ~/.vim/bundle/vim-commentary
$ git clone git://github.com/tpope/vim-vinegar.git ~/.vim/bundle/vim-vinegar 
$ git clone git://github.com/tpope/vim-unimpaired.git ~/.vim/bundle/vim-unimpaired

$ vim ~/.vimrc
    execute pathogen#infect()       # required to enable pathogen plugin path manager
    set nocompatible
    filetype plugin indent on
    syntax on
    set number
    set t_Co=256   # if the colors are not displayed well in the status line, add this
    let g:airline_powerline_fonts = 1  # to enable powerline fonts
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme='simple'
    let g:javascript_plugin_jsdoc = 1
    let g:javascript_plugin_flow = 1
    let g:jsx_ext_required = 0
    let g:netrw_list_hide= '.DS_Store'
    if has("gui_running")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
           set guifont=Inconsolata\ for\ Powerline:h15
        endif
    endif
## in the vim
:so ~/.vimrc   # source to apply
:Helptags  # generate the help tags files for all "doc" directories in the 'runtimepath'
:AirlineTheme simple # Try: powerlineish luna minimalist ...
:hi   # check highlight command, compare with {$vim -u NONE -N}
$ ls ~/.vim/bundle/vim-airline-themes/autoload/airline/themes   # check for available themes

########## Install NeoVim ##########
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository ppa:neovim-ppa/stable
$ sudo apt-get update
$ sudo apt-get install neovim
## Prerequisites for the Python modules
$ sudo apt-get install python-dev python-pip python3-dev python3-pip
## Need to share .vimrc
$ ln -s ~/.vim ~/.config/nvim
$ ln -s ~/.vimrc ~/.vim/init.vim

########## tmux 2 config  ##########
$ tmux -V	# check tmux version
$ cd
$ git clone https://github.com/gpakosz/.tmux.git
$ ln -s -f .tmux/.tmux.conf
$ cp .tmux/.tmux.conf.local .
$ vi ~/.tmux.conf.local	# customize, enable emoji's
/tmux_conf_theme_left		# search this part and enable Powerline fonts

########## Install Nodejs & npm with Node Version Manager ##########
$ dpkg --get-selections | grep node
# (if previous version exists)
    $ sudo apt-get remove --purge node

$ sudo apt-get install build-essential checkinstall
$ sudo apt-get install libssl-dev
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | zsh  # install NVM
# relogin
$ command -v nvm  # check if NVM works
# nvm
* $ nvm -h
$ nvm install stable
$ nvm ls
$ node -v && npm -v
 
########## Install Yarn & create-react-app ##########
$ npm install -g yarn create-react-app
$ cd    # go to $HOME, same as cd ~
$ mkdir D && cd D && mkdir React && cd React
$ create-react-app test
$ cd test
$ vim src/App.js   # check the JSX source if it's beautifully syntax highlighted

# If the default test port 3000 is closed then you have to use port 80.(HTTPS port 443 is already used by SSH)
# [Add Rule] Type: HTTP, Protocol: TCP, Port Range: 80, Source: Anywhere (0.0.0.0/0)
# And you need to switch to root (https://goo.gl/12eT31) since only root can assign ports under 1024.
$ sudo su
#root$ passwd root    # create a temporary password, later delete by $ passwd -l root (not necessary)
root# export HOME=/home/ubuntu   # change $HOME so that default user's settings be applied
root# . ~/.zshrc                 # apply zsh, now prompt changes attractively
root$ vim package.json	# add PORT=80 
	"start": "PORT=80 react-scripus start"
root$ yarn start
@local$ open http://ec2-54-164-49-51.compute-1.amazonaws.com

########## More vim plugins  ##########
# Vimux - Run command in Vim in tmux terminal
$ git clone https://github.com/benmills/vimux.git ~/.vim/bundle/vimux.git
$ tmux
$ vim ~/D/React/test/src/App.js
:call VimuxRunCommand("ls")   # test
# Syntastic - Vim syntax checker / linter
$ git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/bunble/syntastic.git
$ vim ~/.vimrc
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_javascript_checkers=['eslint']
    let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
:set mouse=a
    
########## Install Python package manager pip ##########
$ python3 -V
# Python 3.5.2
$ sudo apt-get install -y python3-pip
$ sudo apt-get install libffi-dev python-dev
$ python -V
# Python 2.7.12
$ pip3 install —upgrade pip
$ pip -V
# pip 9.0.1 from /home/ubuntu/.local/lib/python3.5/site-packages (python 3.5)


########## TIPS: Edit welcome page  ##########
$ cd /etc/update-motd.d   # go to the Message Of The Day directory
$ sudo vim 00-header      # insert emojis 🙋❤️ ❌🈲㊙️㊗️💯💮💵 💻 📱 ⚽️ 🐶 👍 🖕😀 ☹️ 😘 😱 😰 🔑

########## Ubuntu Server Commands ##########
$ uptime
$ who -H   # -a   list users
$ 

########## Useful Vim Commands ##########
^[, ^c instead of <Esc>
^wwv ^ww :Ex<Enter> 30^w| ^ww  #macro: vw:Ex30|
# Vertical split, move focus, :Explorer, Set width 30, move focus back

If you use tmux, try running "tmux -CC" to get iTerm2's tmux integration mode. The tmux windows show up as native iTerm2 windows, and you can use iTerm2's keyboard shortcuts. It even works over ssh!

########## NGINX ###########
$ sudo apt-get install nginx -y
$ sudo systemctl status nginx
$ sudo systemctl start nginx
$ sudo systemctl enable nginx

## allow user ubuntu write access to the public web directory
$ chown -R ubuntu /var/www/html
$ chown -R 755 /var/www/html

