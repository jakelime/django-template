#!/usr/bin/bash

FILES=readme.rst

while true; do
    read -p "Are you sure you want to proceed with overwriting readme.md? " yn
    case $yn in
        [Yy]* )
            for f in $FILES; do
                filename="${f%.*}"
                echo "Converting $f to $filename.md"
                `pandoc $f -f rst -t markdown -o $filename.md`
                echo "done"
            done
            break
            ;;

        [Nn]* )
            exit
            ;;

        * ) echo "Please enter Yes or No"
    esac
done


