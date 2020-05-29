import QtQuick 2.15
import QtQuick.Templates 2.15 as T

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Globals 1.0 as EaGlobals
import easyAppGui.Animations 1.0 as EaAnimations

T.ApplicationWindow {
    id: window

    visible: true
    flags: EaGlobals.Variables.appWindowFlags

    x: EaStyle.Sizes.appWindowX
    y: EaStyle.Sizes.appWindowY

    width: EaStyle.Sizes.appWindowWidth
    height: EaStyle.Sizes.appWindowHeight

    font.family: EaStyle.Fonts.fontFamily
    font.pixelSize: EaStyle.Fonts.fontPixelSize

    color: EaStyle.Colors.mainAreaBackground
    Behavior on color {
        EaAnimations.ThemeChange {}
    }
}
