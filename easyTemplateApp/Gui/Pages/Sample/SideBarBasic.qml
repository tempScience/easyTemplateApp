import QtQuick 2.13
import QtQuick.Controls 2.13

import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

import Gui.Globals 1.0 as ExGlobals

EaComponents.SideBarColumn {

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

    }

}
