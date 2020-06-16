import QtQuick 2.13
import QtQuick.Controls 2.13

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

Rectangle {
    color: EaStyle.Colors.mainContentBackground

    Rectangle {
        anchors.centerIn: parent

        height: 100
        width: 200

        opacity: 0.75
        color: "coral"
        border.width: 1
        border.color: Qt.darker("coral", 2)
    }

}
