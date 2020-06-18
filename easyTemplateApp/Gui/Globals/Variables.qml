pragma Singleton

import QtQuick 2.13

QtObject {
    property var proxy: _pyQmlProxyObj

    property var homeTabButton
    property var projectTabButton
    property var sampleTabButton
    property var experimentTabButton
    property var analysisTabButton
    property var summaryTabButton

    property var addNewSampleButton
    property var generateMeasuredDataButton
    property var startFittingButton
}
