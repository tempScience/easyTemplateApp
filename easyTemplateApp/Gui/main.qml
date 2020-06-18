import QtQuick 2.13

import Gui.Globals 1.0 as ExGlobals
import Gui.Components 1.0 as ExComponents

ExComponents.ApplicationWindow {
    id: window

    title: ExGlobals.Constants.appName

    Item {
        id: item
        anchors.fill: parent
    }

    Timer {
        id: quit
        interval: 2000
        onTriggered: {
            print("* closing app")
            Qt.quit()
        }
    }

    Timer {
        id: saveScreenshot
        interval: 2000
        onTriggered: {
            print("* saving screenshot")
            print("* screenshot path:", _screenshotPath)
            item.grabToImage(function(result) { result.saveToFile(_screenshotPath) })
            quit.start()
        }
    }

    Component.onCompleted: {
        print("* windows size:", window.width, "x", window.height)
        saveScreenshot.start()
    }
}
