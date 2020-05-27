import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12

import easyAppGui.Elements 1.0 as EaElements

EaElements.ApplicationWindow {
    id: window

    Column {
        anchors.centerIn: parent
        spacing: 10

        Label {
            id: label
            text: "initial text"
            color: "white"
        }

        EaElements.Button {
            text: "button 1"
            onClicked: setLabelText(text)
        }

        EaElements.Button {
            text: "button 2"
            onClicked: setLabelText(text)
        }

    }

    function setLabelText(text) {
        label.text = text + " clicked"
    }

}
