/*
 * QML Material - An application framework implementing Material Design.
 *
 * Copyright (C) 2014-2016 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import QtQuick 2.4
import Material 0.3 as Material

/*!
   \qmltype Subheader
   \inqmlmodule Material.ListItems

   \brief Subheaders are special list tiles that delineate distinct sections of a list or grid list.
 */
Material.View {
    id: listItem

    //----- STYLE PROPERTIES -----//

    height: 48 * Material.Units.dp
    property int margins: 16 * Material.Units.dp

    anchors {
        left: parent.left
        right: parent.right
    }

    property int spacing

    property alias text: label.text
    property alias style: label.style
    property alias textColor: label.color
    property bool darkBackground

    Material.Label {
        id: label

        font.pixelSize: 14 * Material.Units.dp
        font.family: "Roboto"
        font.weight: Font.DemiBold

        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            right: parent.right
            margins: margins
        }

        color: darkBackground ? Material.Theme.dark.subTextColor : Material.Theme.light.subTextColor
    }

    property bool showDivider: false

    Material.ThinDivider {
        anchors.bottom: parent.bottom
        visible: showDivider
        darkBackground: listItem.darkBackground
    }
}
