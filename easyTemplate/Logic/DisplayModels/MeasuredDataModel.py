from PySide2.QtCore import Qt, QObject, QPointF, Slot, Signal, Property
from PySide2.QtCharts import QtCharts

class MeasuredDataModel(QObject):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._measuredSeriesRef = None

    def _updateQmlChartViewSeries(self):
        """
        Updates QML LineSeries of ChartView.
        """
        series = []
        for x in range(21):
            series.append(QPointF(x, x * 0.1))
        if self._measuredSeriesRef is not None:
            self._measuredSeriesRef.replace(series)

    @Slot(QtCharts.QXYSeries)
    def setMeasuredSeries(self, series):
        """
        Sets calculated series to be a reference to the QML LineSeries of ChartView.
        """
        self._measuredSeriesRef = series
        self._updateQmlChartViewSeries()
