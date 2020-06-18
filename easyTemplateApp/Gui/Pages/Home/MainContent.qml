import QtQuick 2.13
import QtQuick.Controls 2.13

import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

import Gui.Globals 1.0 as ExGlobals

Item {

    Column {
        anchors.centerIn: parent
        spacing: 0

        EaElements.Label {
            height: 30
            text: "Tutorials"
            font.bold: true
        }

        EaElements.Button {
            text: "Tutorial 1: Sample"
            onClicked: runTutorial1()
        }

        EaElements.Button {
            text: "Tutorial 2: Experiment"
            onClicked: runTutorial2()
        }

        EaElements.Button {
            text: "Tutorial 3: Analysis"
            onClicked: runTutorial3()
        }
    }

    EaElements.RemoteController {
        id: rc
    }

    /*
    function runTutorial1() {
        rc.wait(1000)
        rc.show()

        rc.mouseClick(ExGlobals.Variables.sampleTabButton)
        rc.mouseClick(ExGlobals.Variables.addNewSampleButton)

        rc.wait(1000)
        rc.hide()
    }

    function runTutorial2() {
        rc.wait(1000)
        rc.show()

        rc.mouseClick(ExGlobals.Variables.sampleTabButton)
        rc.mouseClick(ExGlobals.Variables.addNewSampleButton)

        rc.mouseClick(ExGlobals.Variables.experimentTabButton)
        rc.mouseClick(ExGlobals.Variables.generateMeasuredDataButton)

        rc.wait(1000)
        rc.hide()
    }*/

    function runTutorial3() {
        rc.wait(1000)
        rc.show()

        rc.mouseClick(ExGlobals.Variables.sampleTabButton)
        rc.mouseClick(ExGlobals.Variables.addNewSampleButton)

        rc.mouseClick(ExGlobals.Variables.experimentTabButton)
        rc.mouseClick(ExGlobals.Variables.generateMeasuredDataButton)

        rc.mouseClick(ExGlobals.Variables.analysisTabButton)
        rc.mouseClick(ExGlobals.Variables.startFittingButton)

        rc.wait(1000)
        rc.hide()
    }
}
