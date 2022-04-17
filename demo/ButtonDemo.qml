import QtQuick 2.4
import QtQuick.Controls 1.3 as Controls
import Material 0.3 as Material

Item {

    Column {
        anchors.centerIn: parent
        spacing: dp(20)

        Material.Button {
            text: "Simple Button"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: snackbar.open("Simple, isn't it?")
        }

        Material.Button {
            text: "Raised Button"
            elevation: 1
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: snackbar.open("This is a snackbar")
        }

        Material.Button {
            text: "Disabled Raised Button"
            elevation: 1
            enabled: false
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Material.Button {
            text: "Wide Button"

            width: dp(200)
            elevation: 1
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: snackbar.open("That button is wide, and so is this snackbar!")
        }

        Material.Button {
            id: focusableButton
            text: "Focusable with really long text"
            elevation: 1
            activeFocusOnPress: true
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: snackbar.open("The text is really very very very very very long and now it needs to wrap, so this should show as two lines!")
        }

        Material.Button {
            text: "Colored button"
            textColor: Material.Theme.accentColor
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: snackbar.open("That button is colored!")
        }

        Material.Button {
            text: "Focusable button #2"
            elevation: 1
            activeFocusOnPress: true
            backgroundColor: Material.Theme.primaryColor
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: snackbar.open("That button is colored!")
        }
    }

    Material.ActionButton {
        anchors {
            right: parent.right
            bottom: snackbar.top
            margins: dp(32)
        }

        action: Material.Action {
            id: addContent
            text: "&Copy"
            shortcut: "Ctrl+C"
            onTriggered: snackbar.open("We do actions too!")
        }
        iconName: "content/add"
    }

    Material.Snackbar {
        id: snackbar
    }
}
