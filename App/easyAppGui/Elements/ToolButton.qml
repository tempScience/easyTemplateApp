import QtQuick 2.15
import QtQuick.Templates 2.15 as T
import QtQuick.Controls 2.15
import QtQuick.Controls.impl 2.15

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Animations 1.0 as EaAnimations

//import Templates.Controls 1.0

T.ToolButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                            implicitContentHeight + topPadding + bottomPadding)

    padding: 0
    spacing: 0
    leftInset: 0
    rightInset: 0
    topInset: 0
    bottomInset: 0

    //ToolTip.visible: hovered && ToolTip.text !== ""

    /*
    ToolTip {
        text: ToolTip.text
        visible: control.parent.hovered//hovered && ToolTip.text !== ""
    }
    */

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text

        ///font.family: EaStyle.Fonts.icons
        ///font.pixelSize: control.font.pixelSize * 1.25

        color: !control.enabled ?
                   EaStyle.Colors.themeForegroundDisabled :
                   control.checked || control.highlighted ?
                        EaStyle.Colors.themeAccent :
                        EaStyle.Colors.themeForeground
        Behavior on color {
            EaAnimations.ThemeChange {}
        }
    }

    background: Rectangle {
        implicitWidth: EaStyle.Sizes.toolButtonHeight
        implicitHeight: EaStyle.Sizes.toolButtonHeight
        radius: EaStyle.Sizes.toolButtonHeight * 0.5
        color: rippleArea.containsMouse ?
                   (rippleArea.containsPress ?
                        EaStyle.Colors.appBarButtonBackgroundPressed :
                        EaStyle.Colors.appBarButtonBackgroundHovered) :
                    EaStyle.Colors.appBarButtonBackground
        Behavior on color {
            PropertyAnimation {
                duration: rippleArea.containsMouse ? 500 : 0 //Globals.Variables.themeChangeTime
                alwaysRunToEnd: true
                easing.type: Easing.OutCubic
            }
        }

        MouseArea {
            id: rippleArea
            anchors.fill: parent
            hoverEnabled: true
            //onClicked: control.clicked()
            onPressed: mouse.accepted = false
        }
    }
}
