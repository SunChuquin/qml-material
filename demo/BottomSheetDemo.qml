/*
 * QML Material - An application framework implementing Material Design.
 * Copyright (C) 2015 Steve Coffey <scoffey@barracuda.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 2.1 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.4
import Material 0.3 as Material

Item {
    anchors.fill: parent
    id: bottomSheetDemo

    Material.Button {
        anchors.centerIn: parent
        elevation: 1
        text: "Open Bottom Sheet"
        onClicked: {
            actionSheet.open()
        }
    }

    Material.BottomActionSheet {
        id: actionSheet

        title: "Demo!"

        actions: [
            Material.Action {
                iconName: "social/share"
                name: "Share"
            },

            Material.Action {
                iconName: "file/file_download"
                name: "Download (Disabled)"
                enabled: false
            },

            Material.Action {
                iconName: "action/autorenew"
                name: "THIS SHOULD BE HIDDEN"
                visible: false
            },

            Material.Action {
                iconName: "action/settings"
                name: "Details"
                hasDividerAfter: true
            },

            Material.Action {
                iconName: "content/forward"
                name: "Move"
            },

            Material.Action {
                iconName: "action/delete"
                name: "Delete"
            },

            Material.Action {
                iconName: "content/create"
                name: "Rename"
            }
        ]    
    }
}

