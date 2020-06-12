import QtQuick 2.13
import QtQuick.Controls 2.13

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Globals 1.0 as EaGlobals
import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

import Gui.Pages.Home 1.0 as ExHomePage
import Gui.Pages.Project 1.0 as ExProjectPage
import Gui.Pages.Sample 1.0 as ExSamplePage
import Gui.Pages.Experiment 1.0 as ExExperimentPage
import Gui.Pages.Analysis 1.0 as ExAnalysisPage
import Gui.Pages.Summary 1.0 as ExSummaryPage

EaComponents.ApplicationWindow {

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
        ExHomePage.MainContent {},
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
                    ExProjectPage.MainContentDescription {},
                    ExProjectPage.MainContentCifEdit {}
                ]
            }

            sideBar: EaComponents.SideBar {
                basicControls: ExProjectPage.SideBarBasic {}
                advancedControls: ExProjectPage.SideBarAdvanced {}
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
                    ExSamplePage.MainContentStructureView {},
                    ExSamplePage.MainContentCifEdit {}
                ]
            }

            sideBar: EaComponents.SideBar {
                basicControls: ExSamplePage.SideBarBasic {}
                advancedControls: ExSamplePage.SideBarAdvanced {}
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
                    ExExperimentPage.MainContentPlotView {},
                    ExExperimentPage.MainContentTableView {},
                    ExExperimentPage.MainContentCifEdit {}
                ]
            }

            sideBar: EaComponents.SideBar {
                basicControls: ExExperimentPage.SideBarBasic {}
                advancedControls: ExExperimentPage.SideBarAdvanced {}
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
                    ExAnalysisPage.MainContentFitting {},
                    ExAnalysisPage.MainContentCifEdit {}
                ]
            }

            sideBar: EaComponents.SideBar {
                basicControls: ExAnalysisPage.SideBarBasic {}
                advancedControls: ExAnalysisPage.SideBarAdvanced {}
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
                    ExSummaryPage.MainContentReport {}
                ]
            }

            sideBar: EaComponents.SideBar {
                basicControls: ExSummaryPage.SideBarBasic {}
                advancedControls: ExSummaryPage.SideBarAdvanced {}
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
