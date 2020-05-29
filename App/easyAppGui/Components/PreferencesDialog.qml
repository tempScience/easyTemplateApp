import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.impl 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import QtQuick.XmlListModel 2.15

//import easyInterface.QtQuick 1.0 as InterfaceQtQuick
//import easyInterface.Globals 1.0 as InterfaceGlobals

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Globals 1.0 as EaGlobals
import easyAppGui.Elements 1.0 as EaElements

EaElements.Dialog {
    //anchors.centerIn: parent

    title: qsTr("Preferences")

    visible: EaGlobals.Variables.showAppPreferencesDialog
    onClosed: EaGlobals.Variables.showAppPreferencesDialog = false

    modal: true
    standardButtons: Dialog.Ok

    Column {
        //spacing: Globals.Sizes.fontPixelSize * 0.25

        Row {
            spacing: EaStyle.Sizes.fontPixelSize * 0.5

            Label {
                enabled: false
                width: EaStyle.Sizes.fontPixelSize * 6
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Theme") + ":"
            }

            ComboBox {
                width: EaStyle.Sizes.fontPixelSize * 9
                model: [qsTr("Dark"), qsTr("Light"), qsTr("System")]
                currentIndex: EaStyle.Colors.theme === EaStyle.Colors.DarkTheme ? 0 : 1
                onCurrentTextChanged: {
                    if (currentIndex === 0 && EaStyle.Colors.theme !== EaStyle.Colors.DarkTheme) {
                        EaStyle.Colors.theme = EaStyle.Colors.DarkTheme
                    } else if (currentIndex === 1 && EaStyle.Colors.theme !== EaStyle.Colors.LightTheme) {
                        EaStyle.Colors.theme = EaStyle.Colors.LightTheme
                    } else if (currentIndex === 2 && EaStyle.Colors.theme !== EaStyle.Colors.LightTheme) {
                        EaStyle.Colors.theme = EaStyle.Colors.systemTheme
                    }
                }
            }
        }

        Row {
            spacing: EaStyle.Sizes.fontPixelSize * 0.5

            Label {
                enabled: false
                width: EaStyle.Sizes.fontPixelSize * 6
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Zoom") + ":"
            }

            ComboBox {
                width: EaStyle.Sizes.fontPixelSize * 9
                model: ["100%", "110%", "120%", "130%", "140%", "150%"]
                onCurrentTextChanged: {
                    if (parseInt(currentText) === EaStyle.Sizes.defaultScale) {
                        return
                    }
                    EaStyle.Sizes.defaultScale = parseInt(currentText)
                }
            }
        }

        Row {
            spacing: EaStyle.Sizes.fontPixelSize * 0.5

            Label {
                enabled: false
                width: EaStyle.Sizes.fontPixelSize * 6
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Language") + ":"
            }

            ComboBox {
                width: EaStyle.Sizes.fontPixelSize * 9
                model: ["English", "Русский"]

                //onActivated: InterfaceGlobals.Translator.selectLanguage(currentIndex)
                //Component.onCompleted: currentIndex = InterfaceGlobals.Translator.defaultLanguageIndex
                onActivated: {
                    ///appWindow.saveSettings()
                    ///_translator.selectLanguage(currentText)
                    ///appWindow.loadSettings()
                }
            }
        }
    }
}
