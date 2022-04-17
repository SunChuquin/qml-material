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
                rowSpacing: dp(40)
                columnSpacing: dp(40)
                columns: 3

                // Empty filler
                Item { width: 1; height: 1 }

                Material.Label {
                    text: "Normal"
                    color: index == 0 ? Material.Theme.light.textColor : Material.Theme.dark.textColor
                }

                Material.Label {
                    text: "Disabled"
                    color: index == 0 ? Material.Theme.light.textColor : Material.Theme.dark.textColor
                }

                Material.Label {
                    text: "On"
                    color: index == 0 ? Material.Theme.light.textColor : Material.Theme.dark.textColor
                }

                Material.Switch {
                    checked: true
                    darkBackground: index == 1
                }

                Material.Switch {
                    checked: true
                    enabled: false
                    darkBackground: index == 1
                }

                Material.Label {
                    text: "Off"
                    color: index == 0 ? Material.Theme.light.textColor : Material.Theme.dark.textColor
                }

                Material.Switch {
                    darkBackground: index == 1
                }

                Material.Switch {
                    enabled: false
                    darkBackground: index == 1
                }
            }
        }
    }
}
