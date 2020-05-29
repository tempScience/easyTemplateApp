import QtQuick 2.15
import QtQuick.Controls 2.15
//import QtQuick.Controls.Material 2.12

//import easyInterface.QtQuick 1.0 as InterfaceQtQuick
//import easyInterface.App 1.0 as InterfaceApp
//import easyInterface.Globals 1.0 as InterfaceGlobals
//import easyInterface.Animations 1.0 as InterfaceAnimations

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Globals 1.0 as EaGlobals
import easyAppGui.Animations 1.0 as EaAnimations
import easyAppGui.Elements 1.0 as EaElements

EaElements.ToolBar {
    id: appBar

    visible: EaGlobals.Variables.showAppBar

    // Left group of application bar buttons
    Row {
        id: leftButtons

        anchors.left: parent.left
        anchors.leftMargin: 5
        height: parent.height

        EaElements.ToolButton {
            //icon.source: InterfaceGlobals.Icon.save
            text: "A"
            ToolTip.text: qsTr("Save current state of the project")
        }

        EaElements.ToolButton {
            //icon.source: InterfaceGlobals.Icon.undo
            text: "B"
            ToolTip.text: qsTr("Undo")
        }
        EaElements.ToolButton {
            //icon.source: InterfaceGlobals.Icon.redo
            text: "C"
            ToolTip.text: qsTr("Redo")
        }
    }

    // Right group of application bar buttons
    Row {
        id: rightButtons

        anchors.right: parent.right
        anchors.rightMargin: 5
        height: parent.height

        EaElements.ToolButton {
            //icon.source: InterfaceGlobals.Icon.preferences
            text: "D"
            ToolTip.text: qsTr("Application preferences")
            onClicked: EaGlobals.Variables.showAppPreferencesDialog = true
        }

        EaElements.ToolButton {
            //icon.source: InterfaceGlobals.Icon.help
            text: "E"
            ToolTip.text: qsTr("Get online help")
        }

        EaElements.ToolButton {
            //icon.source: InterfaceGlobals.Icon.bug
            text: "F"
            ToolTip.text: qsTr("Report a bug or issue")
        }
    }

    /*
    // Show-hide application bar animation
    Behavior on visible {
        InterfaceAnimations.BarShow {
            parentTarget: appBar
            positionOnTop: true
        }
    }
    */
}
