import QtQuick 2.15
//import QtQuick.Window 2.15
//import QtQuick.Controls 2.15

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

EaElements.ApplicationWindow {
    id: appWindow

    //property alias appBarTabs: appBar.data
    property alias contentArea: contentAreaContainer.data
    //property alias statusBar: statusBarContainer.data

    // Application bar container
    Item {
        id: appBarContainer

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: EaStyle.Sizes.appBarHeight

        EaComponents.ApplicationBar {
            id: appBar

            anchors.fill: parent
        }
    }

    // Content area container
    Item {
        id: contentAreaContainer

        anchors.top: appBarContainer.bottom
        anchors.bottom: statusBarContainer.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    // Status bar container
    Item {
        id: statusBarContainer

        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: EaStyle.Sizes.statusBarHeight

        EaComponents.StatusBar {
            id: statusBar

            anchors.fill: parent
        }
    }

    // Application dialogs (invisible at the beginning)
    EaComponents.PreferencesDialog {
        x: (parent.width - width) * 0.5
        y: (parent.height - height) * 0.5
    }

}
