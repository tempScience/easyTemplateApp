import numpy as np
from typing import List

from PySide2.QtCore import QObject, Slot, Signal, Property
from PySide2.QtCharts import QtCharts

from easyTemplateLib.Objects.fitting import Parameter, Model

from easyTemplateApp.Logic.DisplayModels.DataModels import MeasuredDataModel, CalculatedDataModel
from easyTemplateApp.Logic.QtInterface import QtInterface


def model():
    p1 = Parameter("m", 1.5)
    p2 = Parameter("c", 0.5)

    f = lambda x, m, c: m * x + c  # noqa: E731
    m = Model(f, [p1, p2])
    return m


def scatterGenerator(x: np.ndarray, m = 3, c = 2) -> np.ndarray:
    return m * x + c + np.random.normal(-1.0, 1.0, len(x))


class PyQmlProxy(QObject):

    appNameChanged = Signal()
    calculatorChanged = Signal()

    def __init__(self, parent=None):
        super().__init__(parent)
        self.appName = "easyTemplate"
        self.interface = QtInterface(model=model(), generator=scatterGenerator)
        self._measured_data_model = MeasuredDataModel(self.interface)
        self._calculated_data_model = CalculatedDataModel(self.interface)

    # App info

    @Property(str, notify=appNameChanged)
    def appName(self):
        return self._app_name

    @appName.setter
    def setAppName(self, value: str):
        self._app_name = value
        self.appNameChanged.emit()

    # Charts

    @Slot(QtCharts.QXYSeries)
    def addMeasuredSeriesRef(self, series):
        self._measured_data_model.addSeriesRef(series)

    @Slot(QtCharts.QXYSeries)
    def setCalculatedSeriesRef(self, series):
        self._calculated_data_model.setSeriesRef(series)

    @Slot()
    def generateMeasuredData(self):
        self.interface.new_model()
        self._measured_data_model.updateSeries()

    @Slot()
    def startFitting(self):
        self.interface.fit()
        self._calculated_data_model.updateSeries()

    @Slot(float)
    def fittingFTol(self, ftol: float):
        self.interface.ftol = ftol

    @Property(int, notify=calculatorChanged)
    def calculatorInt(self):
        return self.interface.calculatorList.index(self.interface.calculator)

    @calculatorInt.setter
    def setCalculator(self, value: int):
        self.interface.calculator = self.interface.calculatorList[value]
        self.calculatorChanged.emit()
