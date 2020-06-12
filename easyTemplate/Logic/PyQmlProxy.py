from PySide2.QtCore import QObject, Slot, Signal, Property
from PySide2.QtCharts import QtCharts

from easyTemplate.Logic.DisplayModels.DataModels import MeasuredDataModel, CalculatedDataModel


class PyQmlProxy(QObject):
    appNameChanged = Signal()

    def __init__(self, parent=None):
        super().__init__(parent)
        self.appName = "easyTemplate"
        self._measured_data_model = MeasuredDataModel()
        self._calculated_data_model = CalculatedDataModel()

    @Property(str, notify=appNameChanged)
    def appName(self):
        return self._app_name

    @appName.setter
    def setAppName(self, value: str):
        self._app_name = value
        self.appNameChanged.emit()

    @Slot(QtCharts.QXYSeries)
    def addMeasuredSeriesRef(self, series):
        self._measured_data_model.addSeriesRef(series)

    @Slot(QtCharts.QXYSeries)
    def setCalculatedSeriesRef(self, series):
        self._calculated_data_model.setSeriesRef(series)

    @Slot()
    def generateMeasuredData(self):
        self._measured_data_model.updateSeries()

    @Slot()
    def startFitting(self):
        self._calculated_data_model.updateSeries()

