import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

//import easyInterface.App 1.0 as InterfaceApp
//import easyInterface.Globals 1.0 as InterfaceGlobals
import easyAppGui.Elements 1.0 as EaElements

Column {
    width: parent.width

    EaElements.GroupBox {
        title: "Get Started"
        ///collapsible: false

        EaElements.GroupColumn {

            EaElements.GroupRow {

                EaElements.GroupButton {
                    //icon.source: InterfaceGlobals.Icon.createProject
                    text: qsTr("Create a new project")
                    ToolTip.text: qsTr("???")
                }

                EaElements.GroupButton {
                    //icon.source: InterfaceGlobals.Icon.openProject
                    text: qsTr("Open an existing project")
                    ToolTip.text: qsTr("???")
                    onClicked: InterfaceGlobals.Variable.projectOpened = true
                }
            }

            EaElements.GroupRow {

                EaElements.GroupButton {
                    enabled: false
                    //icon.source: InterfaceGlobals.Icon.cloneProject
                    text: qsTr("Clone an existing project")
                    ToolTip.text: qsTr("???")
                }

                EaElements.GroupButton {
                    enabled: false
                    //icon.source: InterfaceGlobals.Icon.saveProject
                    text: qsTr("Save project as...")
                    ToolTip.text: qsTr("???")
                }
            }
        }
    }

}
