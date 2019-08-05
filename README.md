# Example of QtQuick 2 with PyQt5

[![pipeline status](https://gitlab.com/seanwu1105/pyqt5-qtquick2-example/badges/master/pipeline.svg)](https://gitlab.com/seanwu1105/pyqt5-qtquick2-example/commits/master)
[![coverage report](https://gitlab.com/seanwu1105/pyqt5-qtquick2-example/badges/master/coverage.svg)](https://gitlab.com/seanwu1105/pyqt5-qtquick2-example/commits/master)
[![Requirements Status](https://requires.io/github/seanwu1105/pyqt5-qtquick2-example/requirements.svg?branch=master)](https://requires.io/github/seanwu1105/pyqt5-qtquick2-example/requirements/?branch=master)
[![Linux Release link](https://img.shields.io/badge/download-linux--64bit-brightgreen.svg)](https://gitlab.com/seanwu1105/pyqt5-qtquick2-example/-/jobs/artifacts/master/browse?job=release_linux)

> **NOTE**: A better practice for communication between front-end (QML) and back-end (Python) can be found in [neural-network-sandbox](https://github.com/seanwu1105/pyqt5-qtquick2-example) repository.

## Themes

Run `main.py` with theme names as second parameter.

``` sh
python main.py Default
python main.py Fusion
python main.py Imagine
python main.py Material
python main.py Universal
```

Change environmental variable `QT_QUICK_CONTROLS_STYLE` in `main.py`.

``` python
# main.py

# Set the QtQuick Style
# Acceptable values: Default, Fusion, Imagine, Material, Universal.
os.environ['QT_QUICK_CONTROLS_STYLE'] = 'Default'
```

### Previews

#### Default

![Default](https://i.imgur.com/lwBOtnW.png)

#### Fusion (Breeze Dark)

![Fusion (Breeze Dark)](https://i.imgur.com/wUCiMmD.png)

#### Fusion (Kubuntu)

![Fusion (Kubuntu)](https://i.imgur.com/sQyEek4.png)

#### Imagine

![Imagine](https://i.imgur.com/yU3fb9J.png)

#### Universal (Microsoft Fluent Design Dark)

![Universal (Microsoft Fluent Design Dark)](https://i.imgur.com/74DDF2F.png)

#### Universal (Microsoft Fluent Design Light)

![Universal (Microsoft Fluent Design Light)](https://i.imgur.com/k96MevG.png)

#### Material (Light)

![Material (Light)](https://i.imgur.com/KozSAN1.png)

#### Material (Dark)

![Material (Dark)](https://i.imgur.com/QN8YUZW.png)

## Packaging for Distribution with PyInstaller

You could download the latest binary distribution here (Linux 64bit):

[![Linux Release link](https://img.shields.io/badge/download-linux--64bit-brightgreen.svg)](https://gitlab.com/GLaDOS1105/pyqt5-qtquick2-example/-/jobs/artifacts/master/browse?job=release)

Package the source code manually:

> `.qrc` files must be located in the same directory with the python file which will load the resource in qrc.

``` sh
pyrcc5 -o pyqt5_qtquick2_example/resources.py resources.qrc
pyinstaller main.py -y --windowed --additional-hooks-dir pyi_hooks/
```
