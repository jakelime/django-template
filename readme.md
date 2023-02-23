# Django Template

A template to help start Django projects

## TODO

-   None

## Environments

### Freezing conda environments

``` bash
conda env export > tetk-macos.yml
conda env create -f tetk.yml
```

### Compiling to distribution

#### win

``` bash
conda create --name base39 python=3.9
pip install numpy pandas matplotlib
pip install python-pptx PyYAML tkinterdnd2
// pip install GitPython
pip install pyinstaller
pyinstaller .\tetk\main.py --name tetk --add-data "tetk/bundles/*;bundles/" --windowed --icon="tetk/bundles/icon.ico" --additional-hooks-dir="hook-tkinterdnd2.py" --noconfirm
```

## Documentations

### Sphinx

``` bash
sphinx-quickstart
separate source and build directories: y
sphinx-build -b html source build/html
cd ..
sphinx-apidoc -o docs/source tetk
```

### Readme file converter

``` bash
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
```

Requires `pandoc`

-   <https://stackoverflow.com/questions/45633709/how-to-convert-rst-files-to-md>
-   <https://gist.github.com/zaiste/77a946bbba73f5c4d33f3106a494e6cd>
-   <https://pandoc.org/>
-   `brew install pandoc`
