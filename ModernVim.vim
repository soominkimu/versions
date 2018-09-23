Drew Neil, Modern Vim - Craft Your Development Environment with Vim 8 and Noevim, 2018
28 tips
$ brew install ripgrep
$ rg --version

## **********************************
## Chap. 1. Get Modern Vim
## **********************************
## Tip 1. Installing Vim 8
$ brew install vim
$ brew upgrade vim
$ export VIMCONFIG=~/.vim
$ export VIMDATA=~/.vim

## Tip 2. Switching to Neovim
~/.zshrc
# Use Neovim as "preferred editor"
export VISUAL=nvim
alias v=nvim
# save a ~/.config/nvim/init.vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

## Tip 3. Enabling Python Support in Neovim
:py3 print('hello')
E117: Unknown function: provider#python3#Call
# Enabling the Python 3 Provider
$ pip3 install --user --upgrade neovim
:checkhealth

$ gem install neovim
$ npm install -g neovim
$ pip3 install --user --upgrade neovim-remote
$ nvr -h

## **********************************
## Chap. 2. Installing Plugins
## **********************************
## Tip 4. Understanding Scripts, Plugins, and Packages
# hello.vim
function! SayHello()
  echo 'Hello, world!'
endfunction

command! Hello call SayHello()

nnoremap Q :Hello<CR>

:source hello.vim
:Hello

## Tip 5. Installing Plugins to Your Package


## Tip 6. Managing Plugins with minipac


## **********************************
## Chap. 3. Opening Files
## **********************************
## Tip 7. Finding Files Using Fuzzy Path Matching


## Tip 8. Finding Files Semantically


## Tip 9. Jumping to an Alternate File

## **********************************
## Chap. 4. Working with the Quickfix List
## **********************************
## Tip 10. Running a Build and Navigating Failures


## Tip 11. Switching Compilers


## Tip 12. Linting the Current File


## Tip 13. Searching Files with Grep-Alikes


## Tip 14. Running Tests and Browsing Failures

## **********************************
## Chap. 5. Neovim's Built-In Terminal Emulator
## **********************************
## Tip 15. Grokking Terminal Mode

## Tip 16. Running Programs in a Terminal Buffer

## Tip 17. Managing Windows That Contain Terminal Buffers

## Tip 18. Using Normal Mode Commands in a Terminal Buffer

## Tip 19. Sending Commands to a Terminal Buffer

## Tip 20. Applying Customizations to Your Shell in a Terminal Buffer

## Tip 21. Avoiding Nested Neovim Instances

## Tip 22. Using an Existing nvim Instance as the Preferred Editor

## **********************************
## Chap. 6. Sessions
## **********************************
## Tip 23. Saving and Restoring Sessions

## Tip 24. Making Undo Persist Between Sessions

## Tip 25. Restarting Terminal Processes When Resuming a Session

## **********************************
## Chap. 7. Configuring Vim
## **********************************
## Tip 26. Using Autocommands to Respond to Events

## Tip 27. Respecting Project Conventions

## Tip 28. Setting Buffer-Local Configuration Per Project

## **********************************
## A1. What's Next for Modern Vim? 
## **********************************
## Integrating with the Language Server Protocol

## What's Next for Vim 8

## What's Next for Neovim

#### Additional Tips by S.K.
Open file under cursor - gf

Change buffer
:ls
:b x[tab] or n

Toggle to the alternate buffer
:b# or <Ctrl-^>
