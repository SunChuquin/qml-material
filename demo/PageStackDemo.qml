import QtQuick 2.4 as Quick
import Material 0.3 as Material
import Material.Extras 0.1 as Extra

Quick.Item {

    Quick.Column {
        anchors.centerIn: parent
        spacing: dp(20)

        Material.Button {
            anchors.horizontalCenter: parent.horizontalCenter

            text: "Push subpage"
            elevation: 1
            onClicked: pageStack.push(Qt.resolvedUrl("SubPage.qml"))
        }

        Material.Button {
            anchors.horizontalCenter: parent.horizontalCenter

            text: "Push subpage with sidebar"
            elevation: 1
            onClicked: pageStack.push(Qt.resolvedUrl("SidebarPage.qml"))
        }

        Quick.Image {
            id: image

            anchors.horizontalCenter: parent.horizontalCenter

            source: Qt.resolvedUrl("images/balloon.jpg")
            width: dp(400)
            height: dp(250)

            Material.Ink {
                anchors.fill: parent

                onClicked: overlayView.open(image)
            }
        }

        Material.Label {
            anchors.horizontalCenter: parent.horizontalCenter

            style: "subheading"
            color: Material.Theme.light.subTextColor
            text: "Tap to edit picture"
            font.italic: true
        }
    }

    Material.OverlayView {
        id: overlayView

        width: dp(800)
        height: dp(500)

        Quick.Image {
            id: contentImage
            source: Qt.resolvedUrl("images/balloon.jpg")
            anchors.fill: parent
        }

        Quick.Row {
            anchors {
                top: parent.top
                right: parent.right
                rightMargin: dp(16)
            }
            height: dp(48)
            opacity: overlayView.transitionOpacity

            spacing: dp(24)

            Quick.Repeater {
                model: ["content/add", "image/edit", "action/delete"]

                delegate: Material.IconButton {
                    id: iconAction

                    iconName: modelData

                    color: Material.Theme.dark.iconColor
                    size: iconName == "content/add" ? dp(27) : dp(24)
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }
}
