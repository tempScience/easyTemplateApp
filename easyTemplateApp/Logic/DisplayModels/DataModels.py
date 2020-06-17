from random import random

from PySide2.QtCore import QPointF
from PySide2.QtCharts import QtCharts


class MeasuredDataModel:
    def __init__(self, interface=None):
        self._seriesRefs = []
        self.interface = interface

    def updateSeries(self):
        """
        Generates new data and updates the GUI ChartView LineSeries.
        """
        if not self._seriesRefs:
            return

        series = self.interface.get_XY()

        for seriesRef in self._seriesRefs:
            seriesRef.replace(series)

    def addSeriesRef(self, seriesRef):
        """
        Sets series to be a reference to the GUI ChartView LineSeries.
        """
        self._seriesRefs.append(seriesRef)


class CalculatedDataModel:
    def __init__(self, interface=None):
        self._seriesRef = None
        self.interface = interface

    def updateSeries(self):
        """
        Generates new data and updates the GUI ChartView LineSeries.
        """
        if self._seriesRef is None:
            return

        series = self.interface.get_fit_XY()
        self._seriesRef.replace(series)

    def setSeriesRef(self, seriesRef):
        """
        Sets series to be a reference to the GUI ChartView LineSeries.
        """
        self._seriesRef = seriesRef
