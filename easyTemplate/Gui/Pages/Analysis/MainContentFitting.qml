import QtQuick 2.13
import QtQuick.Controls 2.13
import QtCharts 2.13

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Charts 1.0 as EaCharts

Rectangle {
    color: EaStyle.Colors.mainContentBackground

    EaCharts.ChartView {
        anchors.fill: parent

        EaCharts.ValueAxis {
            id: axisX
            titleText: "X axis"
        }

        EaCharts.ValueAxis {
            id: axisY
            titleText: "Y axis"
        }

        EaCharts.ScatterSeries {
            id: measuredSeries

            axisX: axisX
            axisY: axisY

            XYPoint {
                x: 0
                y: 0
            }
            XYPoint {
                x: 1.1
                y: 2.1
            }
            XYPoint {
                x: 1.9
                y: 3.3
            }
            XYPoint {
                x: 2.1
                y: 2.1
            }
        }

        EaCharts.LineSeries {
            id: calculatedSeries

            axisX: axisX
            axisY: axisY

            XYPoint {
                x: 0
                y: 0
            }
            XYPoint {
                x: 1.1
                y: 2.1
            }
            XYPoint {
                x: 1.9
                y: 3.3
            }
            XYPoint {
                x: 2.1
                y: 2.1
            }
        }

    }

}


