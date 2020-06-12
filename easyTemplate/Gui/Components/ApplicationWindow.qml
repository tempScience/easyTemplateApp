import QtQuick 2.13
import QtQuick.Controls 2.13

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Globals 1.0 as EaGlobals
import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

import Gui.Pages.Home 1.0 as EwHomePage
import Gui.Pages.Project 1.0 as EwProjectPage
import Gui.Pages.Sample 1.0 as EwSamplePage
import Gui.Pages.Experiment 1.0 as EwExperimentPage
import Gui.Pages.Analysis 1.0 as EwAnalysisPage
import Gui.Pages.Summary 1.0 as EwSummaryPage

EaComponents.ApplicationWindow {
    id: window

    ///////////////////
    // APPLICATION BAR
    ///////////////////

    // Left group of application bar tool buttons
    appBarLeftButtons: [
        EaElements.ToolButton {
            fontIcon: "\uf0c7"
            ToolTip.text: qsTr("Save current state of the project")
        },
        EaElements.ToolButton {
            fontIcon: "\uf2ea"
            ToolTip.text: qsTr("Undo")
        },
        EaElements.ToolButton {
            fontIcon: "\uf2f9"
            ToolTip.text: qsTr("Redo")
        }
    ]

    // Right group of application bar tool buttons
    appBarRightButtons: [
        EaElements.ToolButton {
            fontIcon: "\uf013"
            ToolTip.text: qsTr("Application preferences")
            onClicked: EaGlobals.Variables.showAppPreferencesDialog = true
        },
        EaElements.ToolButton {
            fontIcon: "\uf059"
            ToolTip.text: qsTr("Get online help")
        },
        EaElements.ToolButton {
            fontIcon: "\uf188"
            ToolTip.text: qsTr("Report a bug or issue")
        }
    ]

    // Central group of application bar tab buttons (workflow tabs)
    // Tab buttons for the pages described below
    appBarCentralTabs: [
        // Home tab
        EaElements.TabButton {
            height: EaStyle.Sizes.appBarHeight
            fontIcon: "home"
            text: qsTr("Home")
            ToolTip.text: qsTr("Home page")
        },
        // Project tab
        EaElements.TabButton {
            height: EaStyle.Sizes.appBarHeight
            fontIcon: "archive"
            text: qsTr("Project")
            ToolTip.text: qsTr("Project description page")
        },
        // Sample tab
        EaElements.TabButton {
            height: EaStyle.Sizes.appBarHeight
            fontIcon: "gem"
            text: qsTr("Sample")
            ToolTip.text: qsTr("Sample model description page")
        },
        // Experiment tab
        EaElements.TabButton {
            height: EaStyle.Sizes.appBarHeight
            fontIcon: "microscope"
            text: qsTr("Experiment")
            ToolTip.text: qsTr("Experimental settings and data page")
        },
        // Analysis tab
        EaElements.TabButton {
            height: EaStyle.Sizes.appBarHeight
            fontIcon: "calculator"
            text: qsTr("Analysis")
            ToolTip.text: qsTr("Simulation and fitting page")
        },
        // Summary tab
        EaElements.TabButton {
            height: EaStyle.Sizes.appBarHeight
            fontIcon: "clipboard-list"
            text: qsTr("Summary")
            ToolTip.text: qsTr("Summary of the work done")
        }
    ]

    /////////////////////////
    // MAIN CONTENT + SIDEBAR
    /////////////////////////

    // Pages for the tab buttons described above
    contentArea: [
        // Home page
        EwHomePage.MainContent {},
        // Project page
        EaComponents.ContentPage {
            mainContent: EaComponents.MainContent {
                tabs: [
                    EaElements.TabButton {
                        text: qsTr("Description")
                    },
                    EaElements.TabButton {
                        text: qsTr("project.cif")
                    }
                ]

                items: [
                    EwProjectPage.MainContentDescription {},
                    EwProjectPage.MainContentCifEdit {}
                ]
            }

            sideBar: EaComponents.SideBar {
                basicControls: EwProjectPage.SideBarBasic {}
                advancedControls: EwProjectPage.SideBarAdvanced {}
            }
        },
        // Sample page
        EaComponents.ContentPage {
            mainContent: EaComponents.MainContent {
                tabs: [
                    EaElements.TabButton {
                        text: qsTr("Structure view")
                    },
                    EaElements.TabButton {
                        text: qsTr("samples.cif")
                    }
                ]

                items: [
                    EwSamplePage.MainContentStructureView {},
                    EwSamplePage.MainContentCifEdit {}
                ]
            }

            sideBar: EaComponents.SideBar {
                basicControls: EwSamplePage.SideBarBasic {}
                advancedControls: EwSamplePage.SideBarAdvanced {}
            }
        },
        // Experiment page
        EaComponents.ContentPage {
            mainContent: EaComponents.MainContent {
                tabs: [
                    EaElements.TabButton {
                        text: qsTr("Plot view")
                    },
                    EaElements.TabButton {
                        text: qsTr("Table view")
                    },
                    EaElements.TabButton {
                        text: qsTr("experiments.cif")
                    }
                ]

                items: [
                    EwExperimentPage.MainContentStructureView {},
                    EwExperimentPage.MainContentTableView {},
                    EwExperimentPage.MainContentCifEdit {}
                ]
            }

            sideBar: EaComponents.SideBar {
                basicControls: EwExperimentPage.SideBarBasic {}
                advancedControls: EwExperimentPage.SideBarAdvanced {}
            }
        },
        // Analysis page
        EaComponents.ContentPage {
            mainContent: EaComponents.MainContent {
                tabs: [
                    EaElements.TabButton {
                        text: qsTr("Fitting")
                    },
                    EaElements.TabButton {
                        text: qsTr("calculations.cif")
                    }
                ]

                items: [
                    EwAnalysisPage.MainContentFitting {},
                    EwAnalysisPage.MainContentCifEdit {}
                ]
            }

            sideBar: EaComponents.SideBar {
                basicControls: EwAnalysisPage.SideBarBasic {}
                advancedControls: EwAnalysisPage.SideBarAdvanced {}
            }
        },
        // Summary page
        EaComponents.ContentPage {
            mainContent: EaComponents.MainContent {
                tabs: [
                    EaElements.TabButton {
                        text: qsTr("Report")
                    }
                ]

                items: [
                    EwSummaryPage.MainContentReport {}
                ]
            }

            sideBar: EaComponents.SideBar {
                basicControls: EwSummaryPage.SideBarBasic {}
                advancedControls: EwSummaryPage.SideBarAdvanced {}
            }
        }
    ]

    /////////////
    // STATUS BAR
    /////////////

    statusBar: EaElements.StatusBar {
        text: "Status bar"
    }

}
