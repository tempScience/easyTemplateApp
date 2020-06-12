from random import random

from PySide2.QtCore import QObject, QPointF
from PySide2.QtCharts import QtCharts

class MeasuredDataModel(QObject):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._seriesRef = None

    def updateSeries(self):
        """
        Generates new data and updates the GUI ChartView LineSeries.
        """
        if self._seriesRef is None:
            return

        series = [QPointF(x, random()) for x in range(21)]
        self._seriesRef.replace(series)

    def setSeriesRef(self, series):
        """
        Sets series to be a reference to the GUI ChartView LineSeries.
        """
        self._seriesRef = series


class CalculatedDataModel(QObject):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._seriesRef = None

    def updateSeries(self):
        """
        Generates new data and updates the GUI ChartView LineSeries.
        """
        if self._seriesRef is None:
            return

        series = [QPointF(0, random()), QPointF(20, random())]
        self._seriesRef.replace(series)

    def setSeriesRef(self, series):
        """
        Sets series to be a reference to the GUI ChartView LineSeries.
        """
        self._seriesRef = series
