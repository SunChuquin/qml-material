import QtQuick 2.4
import Material 0.3 as Material
import Material.ListItems 0.1 as MaterialListItem

Item {
    Material.View {
        anchors {
            fill: parent
            margins: dp(32)
        }

        elevation: 1

        Column {
            anchors.fill: parent

            MaterialListItem.Subheader {
                text: "Section Subheader"
            }

            MaterialListItem.Standard {
                text: "Standard list item"
            }

            MaterialListItem.Subtitled {
                text: "Subtitled list item"
                subText: "With some subtext!"
            }

            MaterialListItem.Subtitled {
                text: "Subtitled list item"
                subText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec eleifend arcu, eu convallis nisi."
                valueText: "2h ago"

                maximumLineCount: 3
            }

            MaterialListItem.Subtitled {
                text: "Subtitled list item"
                subText: "With some subtext, icon, and secondary item!"
                secondaryItem: Material.Switch {
                    id: enablingSwitch
                    anchors.verticalCenter: parent.verticalCenter
                }

                onClicked: enablingSwitch.checked = !enablingSwitch.checked

                action: Material.Icon {
                    anchors.centerIn: parent
                    name: "device/access_alarm"
                    size: dp(32)
                }
            }

            MaterialListItem.SimpleMenu {
                text: "Subtitled list item"
                model: ["A", "B and some long text that should not clip", "C"]
            }
        }
    }
}
