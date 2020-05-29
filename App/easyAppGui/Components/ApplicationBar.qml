import QtQuick 2.15
import QtQuick.Controls 2.15

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
        anchors.leftMargin: EaStyle.Fonts.fontPixelSize / 2
        anchors.verticalCenter: parent.verticalCenter

        EaElements.ToolButton {
            text: "\uf0c7"
            ToolTip.text: qsTr("Save current state of the project")
        }

        EaElements.ToolButton {
            text: "\uf2ea"
            ToolTip.text: qsTr("Undo")
        }
        EaElements.ToolButton {
            text: "\uf2f9"
            ToolTip.text: qsTr("Redo")
        }
    }

    // Right group of application bar buttons
    Row {
        id: rightButtons

        anchors.right: parent.right
        anchors.rightMargin: EaStyle.Fonts.fontPixelSize / 2
        anchors.verticalCenter: parent.verticalCenter

        EaElements.ToolButton {
            text: "\uf013"
            ToolTip.text: qsTr("Application preferences")
            onClicked: EaGlobals.Variables.showAppPreferencesDialog = true
        }

        EaElements.ToolButton {
            text: "\uf059"
            ToolTip.text: qsTr("Get online help")
        }

        EaElements.ToolButton {
            text: "\uf188"
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
