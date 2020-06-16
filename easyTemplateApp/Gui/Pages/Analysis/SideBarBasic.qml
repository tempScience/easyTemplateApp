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
    }

    EaElements.SideBarButton {
        fontIcon: "play-circle"
        text: "Start fitting"
        onClicked: ExGlobals.Variables.proxy.startFitting()
    }

    ComboBox {
        currentIndex: ExGlobals.Variables.proxy.calculatorInt
//        model: ExGlobals.Variables.proxy.interface.calculatorList
        model: ['scipy', 'not_implemented']
        Component.onCompleted: ExGlobals.Variables.proxy.calculatorInt = currentIndex
    }
}
