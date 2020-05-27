import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T

import easyInterfacingGui.Style 1.0 as EiStyle

T.ApplicationWindow {
    id: window

    visible: true

    width: EiStyle.Sizes.appWidth
    height: EiStyle.Sizes.appHeight

    color: EiStyle.Colors.appBackgroundColor
}
