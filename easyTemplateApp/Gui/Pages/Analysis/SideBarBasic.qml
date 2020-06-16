import QtQuick 2.13
import QtQuick.Controls 2.13

import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

import Gui.Globals 1.0 as ExGlobals

EaComponents.SideBarColumn {

    EaElements.SideBarButton {
        fontIcon: "play-circle"
        text: "Start fitting"
        onClicked: ExGlobals.Variables.proxy.startFitting()
    }

}
