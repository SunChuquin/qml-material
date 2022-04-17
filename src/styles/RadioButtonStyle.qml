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

QuickControlsStyle.RadioButtonStyle {
    id: style

    spacing: 0

    property color color: control.hasOwnProperty("color")
            ? control.color : Theme.light.accentColor

    property bool darkBackground: control.hasOwnProperty("darkBackground")
            ? control.darkBackground : false

    label: Material.Label {
        text: control.text
        style: "button"
        color: control.enabled ? style.darkBackground ? Material.Theme.dark.textColor
                                                        : Material.Theme.light.textColor
                               : style.darkBackground ? Material.Theme.alpha("#fff", 0.30)
                                                        : Material.Theme.alpha("#000", 0.26)
    }

    background: Rectangle {
        color: "transparent"
    }

    indicator: Rectangle {
        implicitWidth: 48 * Material.Units.dp
        implicitHeight: 48 * Material.Units.dp
        radius: implicitHeight / 2
        color: control.activeFocus ? Material.Theme.alpha(control.color, 0.20) : "transparent"

        Rectangle {
            anchors.centerIn: parent

            implicitWidth: 20 * Material.Units.dp
            implicitHeight: 20 * Material.Units.dp
            radius: implicitHeight / 2
            color: "transparent"

            border.color: control.enabled
                ? control.checked ? style.color
                                  : style.darkBackground ? Material.Theme.alpha("#fff", 0.70)
                                                         : Material.Theme.alpha("#000", 0.54)
                : style.darkBackground ? Material.Theme.alpha("#fff", 0.30)
                                       : Material.Theme.alpha("#000", 0.26)

            border.width: 2 * Material.Units.dp
            antialiasing: true

            Behavior on border.color {
                ColorAnimation { duration: 200}
            }

            Rectangle {
                anchors {
                    centerIn: parent
                    alignWhenCentered: false
                }
                implicitWidth: control.checked ? 10 * Material.Units.dp : 0
                implicitHeight: control.checked ? 10 * Material.Units.dp : 0
                color: control.enabled ? style.color
                                       : style.darkBackground ? Material.Theme.alpha("#fff", 0.30)
                                                              : Material.Theme.alpha("#000", 0.26)
                radius: implicitHeight / 2
                antialiasing: true

                Behavior on implicitWidth {
                    NumberAnimation { duration: 200 }
                }

                Behavior on implicitHeight {
                    NumberAnimation { duration: 200 }
                }
            }
        }
    }
}
