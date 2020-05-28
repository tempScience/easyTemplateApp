import os, sys

from PySide2.QtCore import QUrl
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtWidgets import QApplication

from Logic.PyQmlProxy import PyQmlProxy


if __name__ == '__main__':
    # Qml gui style
    #os.environ["QT_QUICK_CONTROLS_STYLE"] = "Material"
    #os.environ["QT_QUICK_CONTROLS_MATERIAL_VARIANT"] = "Dense"

    # Define paths
    current_path = os.path.dirname(sys.argv[0])
    qml_gui_path = QUrl.fromLocalFile(os.path.join(current_path, "Gui", "main.qml"))
    qml_imports_path = str(QUrl.fromLocalFile(os.path.join(current_path)).toString())

    # Create a proxy object between python logic and QML GUI
    py_qml_proxy_obj = PyQmlProxy()

    # Create application
    app = QApplication(sys.argv)
    app.setApplicationName(py_qml_proxy_obj.appName)

    # Create qml application engine
    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("_pyQmlProxyObj", py_qml_proxy_obj)
    engine.addImportPath(qml_imports_path)
    engine.load(qml_gui_path)

    # Event loop
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
