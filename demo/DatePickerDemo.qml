import QtQuick 2.4
import QtQuick.Layouts 1.1
import Material 0.3 as Material

ColumnLayout {

    Material.Dialog {
        id: datePickerDialog
        hasActions: true
        contentMargins: 0
        floatingActions: true

        Material.DatePicker {
            frameVisible: false
            dayAreaBottomMargin : dp(48)
        }

    }

    Material.Dialog {
        id: landscapeDatePickerDialog
        hasActions: true
        contentMargins: 0
        floatingActions: true

        Material.DatePicker {
            frameVisible: false
            dayAreaBottomMargin : dp(48)
            isLandscape: true
        }

    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: dp(16)

        Material.Button {
            Layout.alignment: Qt.AlignCenter
            text: "Show DatePicker Dialog"
            elevation: 1
            onClicked: {
                datePickerDialog.show()
            }
        }

        Material.Button {
            Layout.alignment: Qt.AlignCenter
            text: "Show Landscape DatePicker Dialog"
            elevation: 1
            onClicked: {
                landscapeDatePickerDialog.show()
            }
        }

        Material.DatePicker {
            Layout.alignment: Qt.AlignCenter
        }

        Material.DatePicker {
            Layout.alignment: Qt.AlignCenter
            isLandscape: true
        }
    }
}
