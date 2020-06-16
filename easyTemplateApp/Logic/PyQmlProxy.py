import numpy as np
from typing import List

from PySide2.QtCore import QObject, Slot, Signal, Property
from PySide2.QtCharts import QtCharts

from easyTemplateLib.Objects.fitting import Parameter, Model

from easyTemplateApp.Logic.DisplayModels.DataModels import MeasuredDataModel, CalculatedDataModel
from easyTemplateApp.Logic.QtInterface import QtInterface


def model():
    p1 = Parameter("A", 2.5)
    p2 = Parameter("P", 1.8)

    f = lambda x, a, p: a*np.sin(x*p)  # noqa: E731
    m = Model(f, [p1, p2])
    return m


def scatterGenerator(x: np.ndarray, a = 3, p = 2) -> np.ndarray:
    amp = a*np.random.normal(0.95, 1.05, 1)
    offsetH = 0.25*np.random.normal(-1.0, 1.0, len(x))
    period = x * p*np.random.random(1) + offsetH
    offsetV = 0.1*np.random.normal(-1.0, 1.0, len(x))
    return amp * np.sin(period) + offsetV


class PyQmlProxy(QObject):

    appNameChanged = Signal()
    calculatorChanged = Signal()
    modelChanged = Signal()

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

    # Data

    @Slot()
    def generateMeasuredData(self):
        self.interface.new_model()
        self._measured_data_model.updateSeries()

    # Calculator

    @Property('QVariant', notify=calculatorChanged)
    def calculatorList(self):
        return self.interface.calculatorList

    @Property(int, notify=calculatorChanged)
    def calculatorInt(self):
        return self.interface.calculatorList.index(self.interface.calculator)

    @calculatorInt.setter
    def setCalculator(self, value: int):
        self.interface.calculator = self.interface.calculatorList[value]
        self.calculatorChanged.emit()

    # Fitting

    @Slot()
    def startFitting(self):
        self.interface.fit()
        self._calculated_data_model.updateSeries()
        self.modelChanged.emit()

    @Slot(float)
    def fittingFTol(self, ftol: float):
        self.interface.ftol = ftol

    @Property(str, notify=modelChanged)
    def amplitude(self):
        return str(self.interface.model.A)

    @amplitude.setter
    def setAmplitude(self, value: str):
        value = float(value)
        self.interface.set_parameter('A', value)
        self._calculated_data_model.updateSeries()
        self.modelChanged.emit()

    @Property(str, notify=modelChanged)
    def period(self):
        return str(self.interface.model.P)

    @period.setter
    def setPeriod(self, value: str):
        value = float(value)
        self.interface.set_parameter('P', value)
        self._calculated_data_model.updateSeries()
        self.modelChanged.emit()
