from PySide2.QtCore import QObject, Slot, Signal, Property

from easyTemplate.Logic.DisplayModels import MeasuredDataModel, CalculatedDataModel
#from Logic.DisplayModels import *


class PyQmlProxy(QObject):
    appNameChanged = Signal()

    def __init__(self, parent=None):
        super().__init__(parent)
        self.appName = "easyTemplate"
        self._measured_data_model = MeasuredDataModel.MeasuredDataModel()
        self._calculated_data_model = CalculatedDataModel.CalculatedDataModel()

    @Property(str, notify=appNameChanged)
    def appName(self):
        return self._app_name

    @appName.setter
    def setAppName(self, value: str):
        self._app_name = value
        self.appNameChanged.emit()

    @Slot()
    def refine(self):
        print("Python implementation of refine")

    _measuredData = Property('QVariant', lambda self: self._measured_data_model, constant=True)
    _calculatedData = Property('QVariant', lambda self: self._calculated_data_model, constant=True)
