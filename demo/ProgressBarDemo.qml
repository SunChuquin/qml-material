import QtQuick 2.4
import QtQuick.Layouts 1.1
import Material 0.3 as Material

Item {
    implicitHeight: grid.implicitHeight + dp(40)
    GridLayout {
        id: grid
        anchors.centerIn: parent
        columns: 2
        columnSpacing: dp(20)
        rowSpacing: dp(20)

        Material.Label {
            text: "Determinate"
        }

        Material.ProgressBar {
            Layout.fillWidth: true
            color: theme.accentColor

            SequentialAnimation on value {
                running: true
                loops: NumberAnimation.Infinite

                NumberAnimation {
                    duration: 3000
                    from: 0
                    to: 1
                }

                PauseAnimation { duration: 1000 } // This puts a bit of time between the loop
            }
        }

        Material.Label {
            text: "Indeterminate"
        }

        Material.ProgressBar {
            Layout.fillWidth: true
            color: theme.accentColor
            indeterminate: true
        }

        Material.Label {
            text: "Default"
        }

        Material.ProgressCircle {
            Layout.alignment: Qt.AlignCenter
        }

        Material.Label {
            text: "Custom Color"
        }

        Material.ProgressCircle {
            Layout.alignment: Qt.AlignCenter
            color: "#E91E63"
        }

        Material.Label {
            text: "Cyclic Colors"
        }

        Material.ProgressCircle {
            id: cyclicColorProgress
            Layout.alignment: Qt.AlignCenter
            SequentialAnimation {
                running: true
                loops: Animation.Infinite

                ColorAnimation {
                    from: "red"
                    to: "blue"
                    target: cyclicColorProgress
                    properties: "color"
                    easing.type: Easing.InOutQuad
                    duration: 2400
                }

                ColorAnimation {
                    from: "blue"
                    to: "green"
                    target: cyclicColorProgress
                    properties: "color"
                    easing.type: Easing.InOutQuad
                    duration: 1560
                }

                ColorAnimation {
                    from: "green"
                    to: "#FFCC00"
                    target: cyclicColorProgress
                    properties: "color"
                    easing.type: Easing.InOutQuad
                    duration:  840
                }

                ColorAnimation {
                    from: "#FFCC00"
                    to: "red"
                    target: cyclicColorProgress
                    properties: "color"
                    easing.type: Easing.InOutQuad
                    duration:  1200
                }
            }
        }

        Material.Label {
            text: "Custom Size"
        }

        Material.ProgressCircle {
            Layout.alignment: Qt.AlignCenter
            width: dp(64)
            height: dp(64)
        }

        Material.Label {
            text: "Custom Size + Thickness"
        }

        Material.ProgressCircle {
            Layout.alignment: Qt.AlignCenter
            width: dp(64)
            height: dp(64)
            dashThickness: dp(8)
        }

        Material.Label {
            text: "Determinate Value"
        }

        Material.ProgressCircle {
            id: determinateProgress
            Layout.alignment: Qt.AlignCenter
            width: dp(64)
            height: dp(64)
            indeterminate: false
            minimumValue: 0
            maximumValue: 100

            SequentialAnimation on value {
                running: true
                loops: NumberAnimation.Infinite

                NumberAnimation {
                    duration: 3000
                    from: determinateProgress.minimumValue
                    to: determinateProgress.maximumValue
                }

                PauseAnimation { duration: 1000 }
            }

            Material.Label {
                anchors.centerIn: parent
                text: Math.round(determinateProgress.value) + "%"
            }
        }
    }
}
