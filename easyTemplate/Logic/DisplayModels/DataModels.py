from random import random

from PySide2.QtCore import QPointF
from PySide2.QtCharts import QtCharts


class MeasuredDataModel():
    def __init__(self, parent=None):
        self._seriesRefs = []

    def updateSeries(self):
        """
        Generates new data and updates the GUI ChartView LineSeries.
        """
        if not self._seriesRefs:
            return

        series = [QPointF(x, random()) for x in range(21)]

        for seriesRef in self._seriesRefs:
            print("seriesRef", seriesRef)
            seriesRef.replace(series)

    def addSeriesRef(self, seriesRef):
        """
        Sets series to be a reference to the GUI ChartView LineSeries.
        """
        self._seriesRefs.append(seriesRef)


class CalculatedDataModel():
    def __init__(self, parent=None):
        self._seriesRef = None

    def updateSeries(self):
        """
        Generates new data and updates the GUI ChartView LineSeries.
        """
        if self._seriesRef is None:
            return

        series = [QPointF(0, random()), QPointF(20, random())]
        self._seriesRef.replace(series)

    def setSeriesRef(self, seriesRef):
        """
        Sets series to be a reference to the GUI ChartView LineSeries.
        """
        self._seriesRef = seriesRef
