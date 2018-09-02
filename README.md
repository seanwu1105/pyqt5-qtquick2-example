# Example of QtQuick 2 with PyQt5

## Themes

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

## Dependencies

PyQt5

``` bash
pip install pyqt5
```

Pyinstaller (only for packaging)

``` bash
pip install pyinstaller
```
