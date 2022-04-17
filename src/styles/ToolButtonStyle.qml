/*
 * QML Material - An application framework implementing Material Design.
 *
 * Copyright (C) 2015-2016 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import QtQuick 2.4 as Quick
import QtQuick.Controls.Styles 1.3 as ControlStyle
import Material 0.3 as Material

ControlStyle.ToolButtonStyle {
    panel: View {
        radius: 2 * Material.Units.dp

        implicitHeight: label.text == ""
                ? 44 * Material.Units.dp : Math.max(36 * Material.Units.dp, label.height + 16 * Material.Units.dp)
        implicitWidth: label.text == ""
                ? 44 * Material.Units.dp : Math.max(64 * Material.Units.dp, label.width + 16 * Material.Units.dp)

        Material.Ink {
            id: mouseArea

            anchors.fill: parent

            centered: true
            circular: label.text == ""

            width: parent.width + 8 * Material.Units.dp
            height: parent.height + 8 * Material.Units.dp

            Connections {
                target: control.__behavior
                onPressed: mouseArea.onPressed(mouse)
                onCanceled: mouseArea.onCanceled()
                onReleased: mouseArea.onReleased(mouse)
            }
        }

        Quick.Row {
            anchors.centerIn: parent

            spacing: 8 * Material.Units.dp

            Quick.Image {
                id: image
                anchors.verticalCenter: parent.verticalCenter
                source: control.iconSource
                width: 24 * Material.Units.dp
                height: width
            }

            Material.Label {
                id: label
                anchors.verticalCenter: parent.verticalCenter
                text: control.iconSource !== "" ? "" : control.text
                style: "button"
                color: Material.Theme.lightDark(Material.Theme.primaryColor, Material.Theme.light.textColor,
                                                Material.Theme.dark.textColor)
                visible: text == ""
            }
        }
    }
}
