import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3 as Controls
import Material 0.3 as Material

ColumnLayout {
    spacing: 0

    Repeater {
        model: 2

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: grid.height + dp(80)
            Layout.minimumWidth: grid.width + dp(80)
            color: index == 0 ? "#EEE" : "#333"

            GridLayout {
                id: grid
                anchors.centerIn: parent
                rowSpacing: dp(20)
                columnSpacing: dp(20)
                columns: 2

                Controls.ExclusiveGroup { id: optionGroup }

                Material.Label {
                    Layout.alignment : Qt.AlignHCenter
                    text: "Normal"
                    color: index == 0 ? Material.Theme.light.textColor : Material.Theme.dark.textColor
                }

                Material.Label {
                    Layout.alignment : Qt.AlignHCenter
                    text: "Disabled"
                    color: index == 0 ? Material.Theme.light.textColor : Material.Theme.dark.textColor
                }

                Material.RadioButton {
                    checked: true
                    text: "Option 1"
                    darkBackground: index == 1
                    canToggle: true
                    exclusiveGroup: optionGroup
                }

                Material.RadioButton {
                    checked: true
                    enabled: false
                    text: "Disabled"
                    darkBackground: index == 1
                }

                Material.RadioButton {
                    text: "Option 2"
                    darkBackground: index == 1
                    canToggle: true
                    exclusiveGroup: optionGroup
                }

                Material.RadioButton {
                    enabled: false
                    text: "Disabled"
                    darkBackground: index == 1
                }
            }
        }
    }
}
