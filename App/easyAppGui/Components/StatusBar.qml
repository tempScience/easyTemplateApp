import easyAppGui.Globals 1.0 as EaGlobals
import easyAppGui.Elements 1.0 as EaElements

EaElements.StatusBar {
    visible: EaGlobals.Variables.showAppStatusBar

    text: "Status bar"
}
