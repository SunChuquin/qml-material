import QtQuick 2.4
import QtQuick.Controls 1.3 as Controls
import Material 0.3 as Material
import Material.Extras 0.1

Item {

    Material.Dialog {
        id: alertNoTitleBar
        width: dp(300)
        text: "Discard draft?"
        hasActions: true
        positiveButtonText: "discard"
        negativeButtonText: "cancel"
    }

    Material.Dialog {
        id: alertWithTitleBar
        width: dp(300)
        title: "Use Google's location service?"
        text: "Let Google help apps determine location. This means sending anonymous location data to Google, even when no apps are running."
        hasActions: true
        positiveButtonText: "agree"
        negativeButtonText: "disagree"
    }

    Material.Dialog {
        id: textFieldDialog
        title: "Change Text"
        hasActions: true

        Material.TextField {
            id: optionText
            width: parent.width
            placeholderText: "New Option to Confirm"
        }

        onAccepted: {
            dialogSnackBar.open("You entered: %1".arg(optionText.text))
        }
    }

    Material.Dialog {
        id: scrollingDialog
        title: "Phone ringtone"

        Controls.ExclusiveGroup {
            id: optionGroup
        }

        Material.RadioButton {
            text: "None"
            checked: true
            exclusiveGroup: optionGroup
        }
        Material.RadioButton {
            text: "Callisto"
            exclusiveGroup: optionGroup
        }
        Material.RadioButton {
            text: "Dione"
            exclusiveGroup: optionGroup
        }
        Material.RadioButton {
            text: "Ganymede"
            exclusiveGroup: optionGroup
        }
        Material.RadioButton {
            text: "Hangouts Call"
            exclusiveGroup: optionGroup
        }
        Material.RadioButton {
            text: "Luna"
            exclusiveGroup: optionGroup
        }
        Material.RadioButton {
            text: "Oberon"
            exclusiveGroup: optionGroup
        }
        Material.RadioButton {
            text: "Phobos"
            exclusiveGroup: optionGroup
        }
        Material.RadioButton {
            text: "Pyxis"
            exclusiveGroup: optionGroup
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: dp(20)

        Material.Button {
            text: "Show alert without title bar"
            anchors.horizontalCenter: parent.horizontalCenter
            elevation: 1
            onClicked: {
                alertNoTitleBar.show()
            }
        }

        Material.Button {
            text: "Show alert with title bar"
            anchors.horizontalCenter: parent.horizontalCenter
            elevation: 1
            onClicked: {
                alertWithTitleBar.show()
            }
        }

        Material.Button {
            text: "Show text field dialog"
            anchors.horizontalCenter: parent.horizontalCenter
            elevation: 1
            onClicked: {
                textFieldDialog.show()
            }
        }

        Material.Button {
            text: "Show scrolling dialog"
            anchors.horizontalCenter: parent.horizontalCenter
            elevation: 1
            onClicked: {
                scrollingDialog.show()
            }
        }
    }

    Material.Snackbar {
        id: dialogSnackBar
    }
}
