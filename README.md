# Example of QtQuick 2 with PyQt5

[![build](https://github.com/seanwu1105/pyqt5-qtquick2-example/workflows/build/badge.svg)](https://github.com/seanwu1105/pyqt5-qtquick2-example/actions?query=workflow%3Abuild)

> **NOTE**: ~~A better practice for communication between front-end (QML) and back-end (Python) can be found in [neural-network-sandbox](https://github.com/seanwu1105/neural-network-sandbox) repository.~~

> **NOTE**: For modern UI framework for Python, use PySide6 with [Visual Studio Code Extension](https://github.com/seanwu1105/vscode-qt-for-python) or Qt Creator for the best experience.

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
