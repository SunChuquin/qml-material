/*
 * QML Material - An application framework implementing Material Design.
 *
 * Copyright (C) 2015-2016 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import QtQuick 2.4
import QtQuick.Controls.Styles 1.3 as QuickControlsStyle
import Material 0.3 as Material

QuickControlsStyle.CheckBoxStyle {
    id: style

    property color color: control.hasOwnProperty("color")
            ? control.color : Material.Theme.light.accentColor

    property bool darkBackground: control.hasOwnProperty("darkBackground")
            ? control.darkBackground : false

    spacing: 0

    label: Item {
        implicitWidth: control.text !== "" ? text.implicitWidth + 2 : 0
        implicitHeight: text.implicitHeight

        baselineOffset: text.baselineOffset

        Material.Label {
            id: text

            anchors.centerIn: parent

            property bool darkBackground: control.hasOwnProperty("darkBackground")
            ? control.darkBackground : false

            style: "button"
            color: control.enabled ? darkBackground ? Material.Theme.dark.textColor
                                                    : Material.Theme.light.textColor
                                   : darkBackground ? Material.Theme.alpha("#fff", 0.30)
                                                    : Material.Theme.alpha("#000", 0.26)
            text: control.text
        }
    }

    indicator: Item {
        id: parentRect

        implicitWidth: 48 * Material.Units.dp
        implicitHeight: implicitWidth

        Rectangle {
            id: indicatorRect

            anchors.centerIn: parent

            property color __internalColor: control.enabled
                    ? style.color
                    : style.darkBackground ? Material.Theme.alpha("#fff", 0.30)
                                           : Material.Theme.alpha("#000", 0.26)

            width: 18 * Material.Units.dp
            height: width
            radius: 2 * Material.Units.dp

            border.width: 2 * Material.Units.dp

            border.color: control.enabled
                    ? control.checked ? style.color
                                      : style.darkBackground ? Material.Theme.alpha("#fff", 0.70)
                                                             : Material.Theme.alpha("#000", 0.54)
                    : style.darkBackground ? Material.Theme.alpha("#fff", 0.30)
                                           : Material.Theme.alpha("#000", 0.26)

            color: control.checked ? __internalColor : "transparent"

            Behavior on color {
                ColorAnimation {
                    easing.type: Easing.InOutQuad
                    duration: 200
                }
            }

            Behavior on border.color {
                ColorAnimation {
                    easing.type: Easing.InOutQuad
                    duration: 200
                }
            }

            Item {
                id: container

                anchors.centerIn: indicatorRect

                height: parent.height
                width: parent.width

                opacity: control.checked ? 1 : 0

                property int thickness: 3 * Material.Units.dp

                Behavior on opacity {
                    NumberAnimation {
                        easing.type: Easing.InOutQuad
                        duration: 200
                    }
                }

                Rectangle {
                    id: vert

                    anchors {
                        top: parent.top
                        right: parent.right
                        bottom: parent.bottom
                    }

                    radius: 1 * Material.Units.dp
                    color: style.darkBackground ? Material.Theme.light.textColor : Material.Theme.dark.textColor
                    width: container.thickness * 2

                }
                Rectangle {
                    anchors {
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                    }

                    radius: 1 * Material.Units.dp
                    color: style.darkBackground ? Material.Theme.light.textColor : Material.Theme.dark.textColor
                    height: container.thickness
                }

                transform: [
                    Scale {
                        origin { x: container.width / 2; y: container.height / 2 }
                        xScale: 0.5
                        yScale: 1
                    },
                    Rotation {
                        origin { x: container.width / 2; y: container.height / 2 }
                        angle: 45;
                    },
                    Scale {
                        id: widthScale

                        origin { x: container.width / 2; y: container.height / 2 }
                        xScale: control.checked ? 0.6 : 0.2
                        yScale: control.checked ? 0.6 : 0.2

                        Behavior on xScale {
                            NumberAnimation {
                                easing.type: Easing.InOutQuad
                                duration: 200
                            }
                        }

                        Behavior on yScale {
                            NumberAnimation {
                                easing.type: Easing.InOutQuad
                                duration: 200
                            }
                        }
                    },
                    Translate { y: -(container.height - (container.height * 0.9)) }
                ]
            }
        }
    }
}
