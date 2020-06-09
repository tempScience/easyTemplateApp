import QtQuick 2.13
import QtQuick.Controls 2.13

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Globals 1.0 as EaGlobals
import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

import Gui.Pages.Project 1.0 as ExProjectPage

import Gui.Pages.Project.MainAreaContent 1.0 as ExProjectMainArea
import Gui.Pages.Project.SideBarContent 1.0 as ExProjectSideBar

EaComponents.ApplicationWindow {
    id: window

    // Central group of application bar tabs (workflow tabs)
    appBarTabs: EaElements.TabBar {
        id: centralTabs

        //anchors.top: parent.top
        //anchors.bottom: parent.bottom
        //height: 160
        anchors.horizontalCenter: parent.horizontalCenter
        //anchors.verticalCenter: parent.verticalCenter

        //spacing: EaStyle.Fonts.fontPixelSize

        currentIndex: EaGlobals.Variables.appBarCurrentIndex
        onCurrentIndexChanged: EaGlobals.Variables.appBarCurrentIndex = currentIndex

        background: Rectangle {
            color: "transparent"
        }

        EaElements.TabButton {
            //icon.source: InterfaceGlobals.Icon.home
            fontIcon: "home"
            text: qsTr("Home")
            ToolTip.text: qsTr("Home page")
        }

        EaElements.TabButton {
            //icon.source: InterfaceGlobals.Icon.project
            fontIcon: "archive"
            text: qsTr("Project")
            ToolTip.text: qsTr("Project description page")
        }

        EaElements.TabButton {
            //icon.source: InterfaceGlobals.Icon.sample
            fontIcon: "gem"
            text: qsTr("Sample")
            ToolTip.text: qsTr("Sample model description page")
        }

        EaElements.TabButton {
            //icon.source: InterfaceGlobals.Icon.experiment
            fontIcon: "microscope"
            text: qsTr("Experiment")
            ToolTip.text: qsTr("Experimental settings and data page")
        }

        EaElements.TabButton {
            //icon.source: InterfaceGlobals.Icon.analysis
            fontIcon: "calculator"
            text: qsTr("Analysis")
            ToolTip.text: qsTr("Simulation and fitting page")
        }

        EaElements.TabButton {
            //icon.source: InterfaceGlobals.Icon.summary
            fontIcon: "clipboard-list"
            text: qsTr("Summary")
            ToolTip.text: qsTr("Summary of the work done")
        }

    }


    // Application content: Main Content + Sidebar
    contentArea: EaComponents.PagesView {
        currentIndex: centralTabs.currentIndex

        EaComponents.Page {
            //mainContent: DiffractionHome.MainArea {}
        }

        EaComponents.Page {
            //mainContent: ExProjectPage.MainArea {}
            //sideBar: ExProjectPage.SideBar {}


            mainContent: EaComponents.MainArea {
                tabs: [
                    EaElements.TabButton { text: qsTr("Description") },
                    EaElements.TabButton { text: qsTr("Description2") }
                ]
                content: [
                    ExProjectMainArea.Description {},
                    ExProjectMainArea.Description {}
                ]
            }

            sideBar: EaComponents.SideBar {
                basicControls: ExProjectSideBar.Basic {}
                advancedControls: ExProjectSideBar.Advanced {}
            }

        }

        EaComponents.Page {
            //mainContent: DiffractionSample.MainArea {}
            //sideBar: DiffractionSample.SideBar {}
        }

        EaComponents.Page {
            //mainContent: DiffractionExperiment.MainArea {}
            //sideBar: DiffractionExperiment.SideBar {}
        }

        EaComponents.Page {
            //mainContent: DiffractionAnalysis.MainArea {}
            //sideBar: DiffractionAnalysis.SideBar {}
        }

        EaComponents.Page {
            //mainContent: DiffractionSummary.MainArea {}
            //sideBar: DiffractionSummary.SideBar {}
        }
    }




    /*
    // Central group of application bar tabs (workflow tabs)
    appBarTabs: InterfaceApp.ApplicationBarTabs {
        id: centralTabs

        currentIndex: InterfaceGlobals.Variable.appBarCurrentIndex
        onCurrentIndexChanged: InterfaceGlobals.Variable.appBarCurrentIndex = currentIndex

        InterfaceApp.TabButton {
            icon.source: InterfaceGlobals.Icon.home
            text: qsTr("Home")
            ToolTip.text: qsTr("Home page")
        }

        InterfaceApp.TabButton {
            icon.source: InterfaceGlobals.Icon.project
            text: qsTr("Project")
            ToolTip.text: qsTr("Project description page")
        }

        InterfaceApp.TabButton {
            icon.source: InterfaceGlobals.Icon.sample
            text: qsTr("Sample")
            ToolTip.text: qsTr("Sample model description page")
        }

        InterfaceApp.TabButton {
            icon.source: InterfaceGlobals.Icon.experiment
            text: qsTr("Experiment")
            ToolTip.text: qsTr("Experimental settings and data page")
        }

        InterfaceApp.TabButton {
            icon.source: InterfaceGlobals.Icon.analysis
            text: qsTr("Analysis")
            ToolTip.text: qsTr("Simulation and fitting page")
        }

        InterfaceApp.TabButton {
            icon.source: InterfaceGlobals.Icon.summary
            text: qsTr("Summary")
            ToolTip.text: qsTr("Summary of the work done")
        }
    }

    // Application content: Main Content + Sidebar
    contentArea: InterfaceApp.PagesView {
        currentIndex: centralTabs.currentIndex

        InterfaceApp.Page {
            mainContent: DiffractionHome.MainArea {}
        }

        InterfaceApp.Page {
            mainContent: DiffractionProject.MainArea {}
            sideBar: DiffractionProject.SideBar {}
        }

        InterfaceApp.Page {
            mainContent: DiffractionSample.MainArea {}
            sideBar: DiffractionSample.SideBar {}
        }

        InterfaceApp.Page {
            mainContent: DiffractionExperiment.MainArea {}
            sideBar: DiffractionExperiment.SideBar {}
        }

        InterfaceApp.Page {
            mainContent: DiffractionAnalysis.MainArea {}
            sideBar: DiffractionAnalysis.SideBar {}
        }

        InterfaceApp.Page {
            mainContent: DiffractionSummary.MainArea {}
            sideBar: DiffractionSummary.SideBar {}
        }
    }

    // Status bar
    statusBar: DiffractionApp.StatusBar {}
    */

}
