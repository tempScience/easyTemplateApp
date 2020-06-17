import QtQuick 2.13
import QtQuick.Controls 2.13

import easyAppGui.Globals 1.0 as EaGlobals
import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

import Gui.Globals 1.0 as ExGlobals

EaComponents.SideBarColumn {

    EaElements.SideBarButton {
        fontIcon: "plus-circle"
        text: "Generate measured data"
        onClicked: {
            EaGlobals.Variables.analysisPageEnabled = true
            ExGlobals.Variables.proxy.generateMeasuredData()
        }
    }

    Grid {
        visible: EaGlobals.Variables.analysisPageEnabled

        columns: 4
        columnSpacing: 20
        rowSpacing: 10
        verticalItemAlignment: Grid.AlignVCenter

        EaElements.Label {
            text: "X-shift"
        }

        TextField {
            width: 125
            text: parseFloat(ExGlobals.Variables.proxy.xShift).toFixed(2)
            onEditingFinished: ExGlobals.Variables.proxy.xShift = text
        }

        EaElements.Label {
            text: "Y-shift"
        }

        TextField {
            width: 125
            text: parseFloat(ExGlobals.Variables.proxy.yShift).toFixed(2)
            onEditingFinished: ExGlobals.Variables.proxy.yShift = text
        }
    }

}
