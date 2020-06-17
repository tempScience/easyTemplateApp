import QtQuick 2.13
import QtQuick.Controls 2.13

import easyAppGui.Globals 1.0 as EaGlobals
import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

import Gui.Globals 1.0 as ExGlobals

EaComponents.SideBarColumn {
    width: parent.width

    EaElements.GroupBox {
        title: qsTr("Sample data")
        collapsible: false

        EaElements.SideBarButton {
            fontIcon: "plus-circle"
            text: "Add new sample"
            onClicked: EaGlobals.Variables.experimentPageEnabled = true
        }
    }

    EaElements.GroupBox {
        title: qsTr("Sample parameters")
        visible: EaGlobals.Variables.experimentPageEnabled
        collapsed: false

        Grid {
            columns: 4
            columnSpacing: 20
            rowSpacing: 10
            verticalItemAlignment: Grid.AlignVCenter

            EaElements.Label {
                text: "Amplitude"
            }

            TextField {
                width: 125
                text: parseFloat(ExGlobals.Variables.proxy.amplitude).toFixed(2)
                onEditingFinished: ExGlobals.Variables.proxy.amplitude = text
            }

            EaElements.Label {
                text: "Period"
            }

            TextField {
                width: 125
                text: parseFloat(ExGlobals.Variables.proxy.period).toFixed(2)
                onEditingFinished: ExGlobals.Variables.proxy.period = text
            }
        }
    }

}
