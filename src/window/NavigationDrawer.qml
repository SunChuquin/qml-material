/*
 * QML Material - An application framework implementing Material Design.
 *
 * Copyright (C) 2014-2016 Michael Spencer <sonrisesoftware@gmail.com>
 *               2015 Pierre Jacquier <pierrejacquier39@gmail.com>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import QtQuick 2.4
import Material 0.3 as Material

/*!
   \qmltype NavigationDrawer
   \inqmlmodule Material

   \brief The navigation drawer slides in from the left and is a common pattern in apps.
 */
Material.PopupBase {
    id: navDrawer
    objectName: "navDrawer"

    overlayLayer: "dialogOverlayLayer"
    overlayColor: Qt.rgba(0, 0, 0, 0.3)

    width: Math.min(parent.width - 1 * Material.Device.gridUnit * Material.Units.dp, 5 * Material.Device.gridUnit * Material.Units.dp)

    anchors {
        left: mode === "left" ? parent.left : undefined
        right: mode === "right" ? parent.right : undefined
        top: parent.top
        bottom: parent.bottom

        leftMargin: showing ? 0 : -width - 10 * Material.Units.dp
        rightMargin: showing ? 0 : -width - 10 * Material.Units.dp

        Behavior on leftMargin {
            NumberAnimation { duration: 200 }
        }
        Behavior on rightMargin {
            NumberAnimation { duration: 200 }
        }
    }

    property string mode: "left" // or "right"

    property alias enabled: action.visible

    readonly property Material.Action action: action

    onEnabledChanged: {
        if (!enabled)
            close()
    }

    Material.Action {
        id: action
        iconName: "navigation/menu"
        name: "Navigation Drawer"
        onTriggered: navDrawer.toggle()
    }

    Material.View {
        anchors.fill: parent
        fullHeight: true
        elevation: 3
        backgroundColor: "white"
    }
}
