import QtQuick 2.13
import QtQuick.Controls 2.13

import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

EaComponents.SideBarColumn {

    EaElements.SideBarButton {
        fontIcon: "play-circle"
        text: "Start fitting"
        ToolTip.text: "Click to start fitting"

        onClicked: {
            print("Start fitting button clicked")
        }
    }
}
