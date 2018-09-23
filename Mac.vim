# Clear duplicate [open with] applications
$ /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
$ killall Finder

# update node, npm, yarn
$ node -v && npm -v && yarn -v
$ nvm install node --reinstall-packages-from=node
$ npm install -g npm@latest
$ npm upgrade --global yarn
