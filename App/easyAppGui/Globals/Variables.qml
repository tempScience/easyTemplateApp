pragma Singleton

import QtQuick 2.15

QtObject {

    // Initial application parameters
    property int appBarCurrentIndex: 5
    property int appWindowFlags: Qt.Window // Qt.FramelessWindowHint | Qt.Dialog

    // Initial application elements visibility
    property bool showAppBar: true
    property bool showAppStatusBar: true
    property bool showAppPreferencesDialog: false

    onShowAppPreferencesDialogChanged: print("showAppPreferencesDialog", showAppPreferencesDialog)


}
