import QtQuick 2.13
import QtQuick.Controls 2.13
import QtCharts 2.13

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Charts 1.0 as EaCharts

import Gui.Globals 1.0 as ExGlobals

Rectangle {
    color: EaStyle.Colors.mainContentBackground

    EaCharts.ChartView {
        anchors.fill: parent

        EaCharts.ValueAxis {
            id: axisX

            titleText: "X axis"

            min: 0
            max: 10
        }

        EaCharts.ValueAxis {
            id: axisY

            titleText: "Y axis"

            min: -5
            max: 5
        }

        EaCharts.ScatterSeries {
            id: measuredSeries

            axisX: axisX
            axisY: axisY

            Component.onCompleted: ExGlobals.Variables.proxy.addMeasuredSeriesRef(measuredSeries)
        }

        EaCharts.LineSeries {
            id: calculatedSeries

            axisX: axisX
            axisY: axisY

            Component.onCompleted: ExGlobals.Variables.proxy.setCalculatedSeriesRef(calculatedSeries)
        }

    }

}


