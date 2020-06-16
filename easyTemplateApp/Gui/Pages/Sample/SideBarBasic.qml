import QtQuick 2.13
import QtQuick.Controls 2.13

import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

EaComponents.SideBarColumn {

    Grid {
        columns: 2
        columnSpacing: 20
        rowSpacing: 10
        verticalItemAlignment: Grid.AlignVCenter

        EaElements.Label {
            text: "Amplitude"
        }

        TextField {
            text: "100"
            onEditingFinished: print("Amplitude")
        }

        EaElements.Label {
            text: "Period"
        }

        TextField {
            text: "200"
            onEditingFinished: print("Amplitude")
        }

    }

}
