import QtQuick 2.4
import QtQuick.Layouts 1.1
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
                columns: 3

                // Empty filler
                Item { width: 1; height: 1 }

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

                Material.Label {
                    text: "On"
                    color: index == 0 ? Material.Theme.light.textColor : Material.Theme.dark.textColor
                }

                Material.CheckBox {
                    checked: true
                    text: "On"
                    darkBackground: index == 1
                }

                Material.CheckBox {
                    checked: true
                    enabled: false
                    text: "Disabled"
                    darkBackground: index == 1
                }

                Material.Label {
                    text: "Off"
                    color: index == 0 ? Material.Theme.light.textColor : Material.Theme.dark.textColor
                }

                Material.CheckBox {
                    text: "Off"
                    darkBackground: index == 1
                }

                Material.CheckBox {
                    text: "Disabled"
                    enabled: false
                    darkBackground: index == 1
                }
            }
        }
    }
}
