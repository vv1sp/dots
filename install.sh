#!/bin/bash

FileList=(
	vim \
	vimrc \
	bashrc \
	atom)

DstPrfx="$HOME/."
SrcPrfx="$HOME/dots/"

for item in "${FileList[@]}"
  do
    if [ -e $DstPrfx$item ]; then
      printf '%s is exist!\n' "$DstPrfx$item"
      rm -rf $DstPrfx$item
    fi

  printf 'Create symlink form %s to %s\n' "$SrcPrfx$item" "$DstPrfx$item"
  ln -s $SrcPrfx$item $DstPrfx$item
done

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
