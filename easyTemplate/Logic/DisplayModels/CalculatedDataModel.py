from PySide2.QtCore import Qt, QObject, QPointF, Slot, Signal, Property
from PySide2.QtCharts import QtCharts

class CalculatedDataModel(QObject):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._calculatedSeriesRef = None

    def _updateQmlChartViewSeries(self):
        """
        Updates QML LineSeries of ChartView.
        """
        series = []
        for x in range(21):
            series.append(QPointF(x, x * 0.1))
        if self._calculatedSeriesRef is not None:
            self._calculatedSeriesRef.replace(series)

    @Slot(QtCharts.QXYSeries)
    def setCalculatedSeries(self, series):
        """
        Sets calculated series to be a reference to the QML LineSeries of ChartView.
        """
        self._calculatedSeriesRef = series
        self._updateQmlChartViewSeries()
