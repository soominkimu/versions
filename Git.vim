Rick Umali, Learn GIT in a Month of Lunches
## ******************************
## Chap. 1. Before You Begin
## ******************************
Download DMG package at http://git-scm.com/download/mac

## ******************************
## Chap. 2. An Overview of Git and Version Control
## ******************************
$ git gui
$ cd ~/D/w/Git/
$ git clone https://github.com/rickumali/RickUmaliVanityWebsite
$ git ls-files
$ git blame master README.txt
$ git log --oneline
## Repository: A directory of folder with special operations for viewing the timeline, committing files, and branching.

## ******************************
## Chap. 3. Getting Oriented with Git
## ******************************
$ git config --global user.name "Soomin Kimu"
$ git config --global user.email "soominkimu@gmail.com"
$ git -p config --list      # -p paginate
$ git help -a               # all git commands
$ git help -g               # guides
$ git help glossary

## ******************************
## Chap. 4. Making and Using a Git Repository
## ******************************
$ mkdir buildtools 
$ cd buildtools
$ git init
$ git status
$ echo -n contents > filefilxup.bat                 # STEP.1 create the file
$ git add filefixup.bat                             # STEP.2 telling Git to track the file
$ git status
$ git commit -m "This is the first commit message"  # STEP.3 committing the file to the repo
$ git log --stat

## ******************************
## Chap. 5. Using Git with a GUI
## ******************************
$ git gui
$ git citool
$ gitk          # git log viewer

## ******************************
## Chap. 6. Tracking and Updating Files in Git
## ******************************
$ git commit -a -m "This is the second commit."   # -a automatically stage (git add)
$ git diff
$ git diff --staged
$ git add --dry-run .             # show what git add would do
$ git add .
$ git log --oneline
$ git log --shortstat --oneline

## ******************************
## Chap. 7. Committing Parts of Changes
## ******************************
$ git rm a
$ git mv d another_rename
$ git add -p
$ git reset math.sh
$ git checkout -- math.sh

## ******************************
## Chap. 8. The Time Machine that is Git
## ******************************
$ git log --parents --abbrev-commit
$ git log --patch
$ git log --patch-with-stat
$ git log --oneline math.sh
$ git commit --amend

** TIP ** change core.editor
$ git config --global --list
$ git config --global core.editor "vim"

$ git rev-parse HEAD      # rev-parse translates branch names to their corresponding SHA1 IDs
$ git rev-parse master    # SHA1 (Secure Hash Algorithm 1)

$ git checkout 12227ea    # SHA1 ID ... Detached HEAD
$ git checkout master     # back to the master branch
$ git tag four_files_galore -m "The commit with four files" 12227ea
$ git show four_files_galore
$ gitk&
$ git checkout four_files_galore
$ git checkout master

$ git log -N              # limit output to N commits
$ git log --relative-date

$ git --no-pager log --oneline    # do not use less
$ git tag -d test_tag
$ git --no-pager log :/"first commit"   # search for the comment
$ git log --author=rgu
$ git log --since=yesterday

## ******************************
## Chap. 9. Taking a Fork in the Road
## ******************************
$ git branch dev      # create a branch dev
$ git checkout dev
$ git branch -d master

$ git config --global alias.lol "log --graph --decorate --pretty=oneline --all --abbrev-commit"
$ git --no-pager lol

$ git branch -v     # list all branches with SHA1 ID information

$ git branch fixing_readme 66b5466
$ git checkout fixing_readme
$ git checkout -b another_fix_branch fixing_readme  # -b create the branch
$ git checkout master
$ git branch -d fixing_readmet

$ git reflog      # record of all the times you changed branches (via git checkout)

$ git stash       # to save all your work temprarily (temporary commit)
$ git stash list  # WIP: Work In Progress
$ git stash pop

$ git branch -m old_name new_name

$ git branch --contains random_tag_on_file

## ******************************
## Chap. 10. Merging Branches
## ******************************
$ git diff master...bugfix
$ git diff --name-status master...bugfix
$ git checkout master
$ git merge bugfix
$ git log -1

$ git mergetool
$ git merge --abort
$ git merge-base master bugfix

## ******************************
## Chap. 11. Cloning
## ******************************
$ git clone math math.clone1
$ git branch --all
$ du -sh .git
$ git clone --bare math math.git    # bare directory
$ git ls-tree HEAD                  # shows all the files at the HEAD
$ git ls-tree four_files_galore     # ... at the tag
$ git clone --depth 2 file:///Users/jianak/D/w/Git/math math.depth2

## ******************************
## Chap. 12. Collaborating with Remotes
## ******************************
$ git remote -v             # shows the remote URL
$ git remote rename origin beginning
$ git remote add bob ../math.bob
$ git ls-remote
$ git ls-remote origin
$ GIT_TRACE_PACKET=1 git ls-remote

## ******************************
## Chap. 13. Pushing Your Changes
## ******************************
$ git push origin master
$ git remote -v show origin
$ git checkout another_fix_branch
$ git push
$ git push --set-upstream origin new_branch
$ git config --get-regexp branch
$ git push origin :new_branch       # git push origin src:dest  (refspec)

$ git tag -a two_back -m "Two behind the HEAD" HEAD^^
$ git push origin two_back
$ git push origin :two_back         # delete tag on the remote
$ git tag -d two_back

$ git config --global push.default simple

## ******************************
## Chap. 14. Keeping in Sync
## ******************************
$ git pull                # pull = fetch + merge
$ git fetch
$ git merge FETCH_HEAD    # FETCH_HEAD points to the most recent remote-tracking branch
$ git rev-parse FETCH_HEAD
$ git rev-parse origin/master
$ git pull --ff-only
$ git config pull.ff only

## Two step solution
$ git fetch
$ git diff HEAD..FETCH_HEAD   # shows how to change the HEAD so it looks like FETCH_HEAD
$ git status
$ vim another_rename      # edit conflicting file
$ git add another_rename
$ git citool              # commit with the default message

$ git remote add bill ../math.bill
$ git branch --set-upstream-to=bill/master
$ git branch --set-upstream-to=origin/master
$ cat .git/FETCH_HEAD

## ******************************
## Chap. 15. Software Archaeology
## ******************************
$ git --no-pager log --parents --oneline
$ git --no-pager log 0ed73ed -n 1
$ git --no-pager log --merges --oneline
$ git --no-pager log --stat --online readme.txt renamed_file
$ git --no-pager log --grep=change
$ git --no-pager log --since 10/22/2017 --until 10/23/2017
$ git --no-pager shortlog
$ git --no-pager log --author="Soomin"
$ git --no-pager log --stat HEAD^..HEAD   # HEAD^ is the parent of HEAD
$ git --no-pager log --patch HEAD^..HEAD
$ git branch --column
$ git name-rev 80f5738
$ git branch -r --contains ce051a3
$ gitk --all
$ git --no-pager grep -i change   # search all the files in the repository
$ gitk math.sh&
$ git --no-pager show dab42fb
$ git gui blame math.sh
$ git gui browser master
$ git --no-pager blame math.sh
$ git notes add -m "This is an attached note"

## ******************************
## Chap. 16. Understanding Git Rebase
## ******************************
$ git checkout new_feature
$ git --no-pager log --oneline master..new_feature  # commits between master and new_feature
$ git rebase master

$ git --no-pager reflog       # reflog: Reference logs, alias of git log -g --abbrev-commit --pretty=oneline
$ git reset --hard HEAD@{4}   # --hard switch says to reset both the staging area and the working directory

$ git --no-pager log -n 2 --stat --oneline
$ git rebase --interactive master
* Change the second "pick" to "squash" in the vim editor.
$ git --no-pager log -n 1 --stat

$ git cherry-pick e06bdd2     # makes a copy of the single SHA1 ID

## ******************************
## Chap. 17. Workflows and Branching Conventions
## ******************************
***** git-flow by Vincent Driessen(nvie)
$ git init
$ git commit --allow-empty -m "Initial commit"
$ git branch develop
$ git --no-pager log --decorate

$ git checkout -b feature/sum develop   # make a feature branch off the devlop branch
$ vim sum.sh
$ git add sum.sh
$ git commit -m "The sum program"

$ git checkout develop
$ git merge --no-ff feature/sum         # --no-ff prevents a fast-forward merge
$ git --no-pager log -1
$ git branch -d feature/sum

$ git checkout -b release-1.0 develop
$ vim sum.sh
$ git commit -a -m "Bumping to version 1.0"

$ git checkout master
$ git merge --no-ff release-1.0
$ git tag -a V1.0 -m "Release 1.0"

$ git checkout develop
$ git merge --no-ff release-1.0
$ git branch -d release-1.0

***** GitHub's flow  *Scott Chacon
$ git init
$ git commit --allow-empty -m "Initial commit"

$ git checkout -b sum_program         # make a descriptively named branch
$ vim sum.sh
$ git add sum.sh
$ git commit -m "The sum program"

$ git checkout master
$ git merge sum_program

## ******************************
## Chap. 18. Working with GitHub
## ******************************
$ ssh-keygen -t rsa -b 4096 -C "soominkimu@gmail.com"   # generate a new SSH key
$ eval "$(ssh-agent -s)"      # start the ssh-agent in the background
$ vim ~/.ssh/config           # edit Host
$ ssh-add -K ~/.ssh/id_rsa

$ ssh -T git@github.com       # Test SSH connection

$ git clone https://github.com/soominkimu/math.git

# Add local repo to GitHub (need to make GitHub repo first)
$ git remote add origin https://github.com/soominkimu/ES6zakas.git
$ git remote -v show origin
$ git push -u origin master

## ******************************
## Chap. 19. Third-party Tools and Git
## ******************************
Atlassian's SourceTree
Check http://git-scm.com//downloads/guis

## ******************************
## Chap. 20. Sharpening Your Git
## ******************************
Git configuration variables control how Git behaves.
Check https://git-scm.com/docs/git-config

$ cd ~/D/w/Git/math
$ git config --local --list     # current repository
$ git config --global --list    # across all repositories (user-specific)
$ git config --system --list    # server-wide

* Section.(Subsection.)Key      # remote.origin.url=https://...

$ git -c log.date=relative log -n 2     # -c configuration parameter to override a config temporarily

$ git config --local log.date relative  # permanent config

Local: $GIT_DIR/config
Global: $HOME/.gitconfig
System: /Applications/Xcode.app/Contents/Developer/usr/share/git-core/gitconig
        /usr/local/etc/gitconfig

$ git config --local --edit

$ git -c core.editor=echo config --system --edit   # prints the config file path
$ cat `git config core.excludesfile`

$ git config --local --add help.autocorrect -1
$ git statsu        # misspelled

https://github.com/tpope/vim-fugitive
:Gblame
:Gstatus

## *************
# To delete a commit
$ git rebase --onto master~2 master~1 master    # deletes master~1 commit

$ git rebase --abort
$ git reset --hard 19e50e0    # rewind to the previous commit

## *************
# To add a new explicit (other than 'origin') remote

$ git remote set-url dashgon https://ID:PW@github.com/dashgon/reposit.git
$ git remote -v

## Update all vim plugins recursively
$ ~/.vim/bundle> find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;

## To upload a local repo to Github (ex, csv2json)
At first, create a new repo at Github with the same name
$ git remote add origin https://github.com/soominkimu/csv2json.git
$ git remote -v
$ git push -u origin master  # will be requested for the keychain password in Mac

