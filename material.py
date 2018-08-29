import os
import sys

from PySide2.QtWidgets import QApplication
from PySide2.QtCore import QUrl
from PySide2.QtQml import QQmlApplicationEngine

if __name__ == "__main__":
    app = QApplication(sys.argv)
    os.environ["QT_QUICK_CONTROLS_STYLE"] = "Material"
    engine = QQmlApplicationEngine()
    engine.load(QUrl('basic.qml'))
    sys.exit(app.exec_())
