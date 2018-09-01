import os
import sys

from PyQt5.QtCore import QUrl
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import QQmlApplicationEngine


if __name__ == "__main__":
    # Set the QtQuick Style
    # Acceptable values: Default, Fusion, Imagine, Material, Universal
    os.environ["QT_QUICK_CONTROLS_STYLE"] = "Material"
    # Create an instance of the application
    app = QApplication(sys.argv)
    # Create QML engine
    engine = QQmlApplicationEngine()
    # Load the qml file into the engine
    engine.load(QUrl("pyqt5_qtquick2_example/qml/main.qml"))
    # engine.load(QUrl("test.qml"))
    # Qml file error handling
    if not engine.rootObjects():
        sys.exit(-1)

    # engine.quit.connect(app.quit)
    # Unnecessary,
    # since QQmlEngine.quit has already connect to QCoreApplication.quit

    sys.exit(app.exec_())
