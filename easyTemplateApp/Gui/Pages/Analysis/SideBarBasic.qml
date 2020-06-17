import QtQuick 2.13
import QtQuick.Controls 2.13

import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

import Gui.Globals 1.0 as ExGlobals

EaComponents.SideBarColumn {

    EaElements.SideBarButton {
        fontIcon: "plus-circle"
        text: "Generate measured data"
        onClicked: ExGlobals.Variables.proxy.generateMeasuredData()
        Component.onCompleted: ExGlobals.Variables.proxy.generateMeasuredData()
    }

    Grid {
        columns: 2
        columnSpacing: 20
        rowSpacing: 10
        verticalItemAlignment: Grid.AlignVCenter

        EaElements.Label {
            text: "Amplitude"
        }

        TextField {
            text: ExGlobals.Variables.proxy.amplitude
            onEditingFinished: ExGlobals.Variables.proxy.amplitude = text
        }

        EaElements.Label {
            text: "Period"
        }

        TextField {
            text: ExGlobals.Variables.proxy.period
            onEditingFinished: ExGlobals.Variables.proxy.period = text
        }

        EaElements.Label {
            text: "X-shift"
        }

        TextField {
            text: ExGlobals.Variables.proxy.xShift
            onEditingFinished: ExGlobals.Variables.proxy.xShift = text
        }

        EaElements.Label {
            text: "Y-shift"
        }

        TextField {
            text: ExGlobals.Variables.proxy.yShift
            onEditingFinished: ExGlobals.Variables.proxy.yShift = text
        }
    }

    EaElements.SideBarButton {
        fontIcon: "play-circle"
        text: "Start fitting"
        onClicked: ExGlobals.Variables.proxy.startFitting()
    }

}
