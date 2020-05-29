from PySide2.QtCore import QObject, Slot, Signal, Property

class PyQmlProxy(QObject):
    appNameChanged = Signal()

    def __init__(self, parent=None):
        super().__init__(parent)
        self.appName = "App Name"

    @Property(str, notify=appNameChanged)
    def appName(self):
        return self._app_name

    @appName.setter
    def setAppName(self, value: str):
        self._app_name = value
        self.appNameChanged.emit()

