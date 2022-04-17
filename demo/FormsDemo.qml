import QtQuick 2.4
import QtQuick.Layouts 1.1
import Material 0.3 as Material
import Material.ListItems 0.1 as MaterialListItem

Item {
    Material.View {
        anchors.centerIn: parent

        width: dp(350)
        height: column.implicitHeight + dp(32)

        elevation: 1
        radius: dp(2)

        ColumnLayout {
            id: column

            anchors {
                fill: parent
                topMargin: dp(16)
                bottomMargin: dp(16)
            }

            Material.Label {
                id: titleLabel

                anchors {
                    left: parent.left
                    right: parent.right
                    margins: dp(16)
                }

                style: "title"
                text: "Edit shipping info"
            }

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: dp(8)
            }

            MaterialListItem.Standard {
                action: Material.Icon {
                    anchors.centerIn: parent
                    name: "action/account_circle"
                }

                content: Material.TextField {
                    anchors.centerIn: parent
                    width: parent.width

                    text: "Alex Nelson"
                }
            }

            MaterialListItem.Standard {
                action: Material.Icon {
                    anchors.centerIn: parent
                    name: "maps/place"
                }

                content: Material.TextField {
                    anchors.centerIn: parent
                    width: parent.width

                    text: "100 Main Street"
                }
            }

            MaterialListItem.Standard {
                action: Item {}

                content: RowLayout {
                    anchors.centerIn: parent
                    width: parent.width

                    Material.TextField {
                        Layout.alignment: Qt.AlignVCenter
                        Layout.preferredWidth: 0.4 * parent.width

                        text: "New York"
                    }

                    Material.MenuField {
                        Layout.alignment: Qt.AlignVCenter
                        Layout.preferredWidth: 0.2 * parent.width

                        model: ["NY", "NC", "ND"]
                    }

                    Material.TextField {
                        Layout.alignment: Qt.AlignVCenter
                        Layout.preferredWidth: 0.3 * parent.width

                        text: "10011"
                    }
                }
            }

            MaterialListItem.Standard {
                action: Material.Icon {
                    anchors.centerIn: parent
                    name: "communication/email"
                }

                content: Material.TextField {
                    anchors.centerIn: parent
                    width: parent.width

                    placeholderText: "Email"
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: dp(8)
            }

            RowLayout {
                Layout.alignment: Qt.AlignRight
                spacing: dp(8)

                anchors {
                    right: parent.right
                    margins: dp(16)
                }

                Material.Button {
                    text: "Cancel"
                    textColor: Material.Theme.primaryColor
                }

                Material.Button {
                    text: "Done"
                    textColor: Material.Theme.primaryColor
                }
            }
        }
    }
}
