import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtCharts 2.12

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

//import easyInterface.App 1.0 as InterfaceApp

//import easyDiffraction.App.Project.MainArea 1.0 as DiffractionMainArea

//InterfaceApp.MainAreaContainer {
Item {

    // Tabs
    EaComponents.MainAreaTabs {
        id: tabs

        EaElements.TabButton {
            text: qsTr("Description")
        }
    }

    // Content
    EaComponents.MainAreaContent {
        id: content

        anchors.top: tabs.bottom
        currentIndex: tabs.currentIndex

        //DiffractionMainArea.Description {}
    }
}
