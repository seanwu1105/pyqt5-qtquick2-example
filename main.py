import os
import sys

from PyQt5.QtCore import QUrl, QObject
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import QQmlApplicationEngine


def main():
    # Set the QtQuick Style
    # Acceptable values: Default, Fusion, Imagine, Material, Universal
    os.environ['QT_QUICK_CONTROLS_STYLE'] = 'Universal'

    # Create an instance of the application
    # QApplication MUST be declared in global scope to avoid segmentation fault
    app = QApplication(sys.argv)

    # Create QML engine
    engine = QQmlApplicationEngine()

    # Load the qml file into the engine
    engine.load(QUrl('pyqt5_qtquick2_example/qml/main.qml'))

    # Qml file error handling
    if not engine.rootObjects():
        sys.exit(-1)

    # Send QT_QUICK_CONTROLS_STYLE to main qml (only for demonstration)
    # For more details and other methods to communicate between Qml and Python:
    #   http://doc.qt.io/archives/qt-4.8/qtbinding.html
    qtquick2Themes = engine.rootObjects()[0].findChild(QObject, 'qtquick2Themes')
    qtquick2Themes.setProperty('text', os.environ['QT_QUICK_CONTROLS_STYLE'])

    # engine.quit.connect(app.quit)
    # Unnecessary,
    # since QQmlEngine.quit has already connect to QCoreApplication.quit

    res = app.exec_()
    # Deleting the view before it goes out of scope is required to make sure all
    # child QML instances are destroyed in the correct order, or an segmentation
    # error would occur.
    del engine
    sys.exit(res)


if __name__ == '__main__':
    main()
