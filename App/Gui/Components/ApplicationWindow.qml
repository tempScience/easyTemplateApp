import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12

import easyInterfacingGui.Elements 1.0 as EiElements

EiElements.ApplicationWindow {
    id: window

    Column {
        anchors.centerIn: parent
        spacing: 10

        Label {
            id: label
            text: "initial text"
            color: "white"
        }

        EiElements.Button {
            text: "button 1"
            onClicked: setLabelText(text)
        }

        EiElements.Button {
            text: "button 2"
            onClicked: setLabelText(text)
        }

    }

    function setLabelText(text) {
        label.text = text + " clicked"
    }

}
