import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T

import easyAppGui.Style 1.0 as EaStyle

T.ApplicationWindow {
    id: window

    visible: true

    width: EaStyle.Sizes.appWidth
    height: EaStyle.Sizes.appHeight

    color: EaStyle.Colors.appBackgroundColor
}
