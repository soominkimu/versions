#!/bin/zsh
#############################################
# Change Directory to Current saved dir
# by Soomin K.
#############################################
HIST=~/z/cdc-hist.txt
LDIR=''  # Last dir in history
chcur () {
  # cd $1
  print $1
}
if [ -z $1 ]; then # No param, just save current dir mode
  CUR=`pwd`
  if [ -f $HIST ]; then
    LDIR=`tail -n 1 $HIST`
  fi
  if [[ "${CUR}" != "${LDIR}" ]]; then
    print "${CUR}" >> $HIST
  fi
else  # Change to the saved current dir mode
  if [ -f $HIST ]; then
    LDIR=`tail -n 1 $HIST`
    chcur "${LDIR}"
    # exec /bin/zsh  # or use 'source'
  else
    echo "ERROR: Current dir NOT saved!"
  fi
fi
