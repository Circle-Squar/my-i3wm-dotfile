#!/bin/bash
# Check is exist about dotfile 
exist=
for i in i3 polybar picom scripts start-up-scripts
do
  if [ -e ~/.config/$i ]
  then 
    echo [Warning] $i Exist!
    exist="$i $exist"
  fi
done


echo [INFO] Backing up file to ~/.config/i3wm-backup-dotfile
if [ -e ~/.config/i3wm-backup-dotfile ]
then 
  count=1
  while [ -e ~/.config/i3wm-backup-dotfile-$count ]
  do
    let count+=1
  done

  if [ $count -gt 10 ]
  then 
    echo [Warning] You have more than 10 i3wm-backup-dotfile, Please Check it, Del it if you want!
  fi

  echo [Warning] Lastest i3wm Backup exist
  echo [Warning] Rename ~/.config/i3wm-backup-dotfile to ~/.config/i3wm-backup-dotfile-$count
  mv ~/.config/i3wm-backup-dotfile ~/.config/i3wm-backup-dotfile-$count
fi
mkdir ~/.config/i3wm-backup-dotfile

# BackUp
for i in $exist
do
  cp ~/.config/$i ~/.config/i3wm-backup-dotfile/ -r
done

# rm all old dotfile

for i in $exist
do
  rm ~/.config/$i -rf
done

# Copy All of i3 dotfile to .config
for i in i3 polybar picom scripts start-up-scripts
do
  echo [INFO] Copying $i to .config
  cp $i ~/.config
done

rm ~/.config/start-up-scripts/Wacom.sh

# Copy WallPaper 
wallDir=true
if [ -e ~/Pictures ]
then
  if [ ! -d ~/Pictures ]
  then
    echo "[ERROR] ~/Pictures Was a file please remove it!"
    exit
  fi
else
  mkdir ~/Pictures
fi

if [ $wallDir == true ]
then
  echo [INFO] Copying WallPapers to ~/Pictures/
  cp WallPapers ~/Pictures/ -r
fi

echo [INFO] Done! Please restarting i3wm
