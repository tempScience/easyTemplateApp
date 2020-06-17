import QtQuick 2.13
import QtQuick.Controls 2.13

import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

import Gui.Globals 1.0 as ExGlobals
import Gui.Pages.Project 1.0 as ExProjectPage

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

}
