/*
 * QML Material - An application framework implementing Material Design.
 *
 * Copyright (C) 2014-2016 Michael Spencer <sonrisesoftware@gmail.com>
 *               2015 Bogdan Cuza <bogdan.cuza@hotmail.com>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import QtQuick 2.4 as Quick
import QtQuick.Window 2.2
import Material 0.3 as Material
import QtGraphicalEffects 1.0 as QtGraphicalEffects

/*!
   \qmltype Icon
   \inqmlmodule Material

   \brief Displays an icon from the Material Design and FontAwesome icon collections.
*/
Quick.Item {
    id: icon

    property color color: Material.Theme.light.iconColor
    property real size: 24 * Material.Units.dp

    /*!
       The name of the icon to display.

       \sa source
    */
    property string name

    /*!
       A URL pointing to an image to display as the icon. By default, this is
       a special URL representing the icon named by \l name from the Material Design
       icon collection or FontAwesome. The icon will be colorized using the specified \l color,
       unless you put ".color." in the filename, for example, "app-icon.color.svg".

       \sa name
      */
    property string source: name ? "icon://" + name : ""

    property bool valid: source.indexOf("icon://awesome/") == 0
            ? awesomeIcon.valid : image.status == Quick.Image.Ready

    width: size
    height: size

    property bool colorize: icon.source.indexOf(".color.") === -1

    Quick.Image {
        id: image

        anchors.fill: parent
        visible: source != "" && !colorize

        source: {
            if (icon.source.indexOf("icon://awesome/") == 0) {
                return ''
            } else if (icon.source.indexOf('icon://') === 0) {
                var name = icon.source.substring(7)

                if (name) {
                    if (Material.Theme.iconsRoot.indexOf('qrc') != -1)
                        return Material.Theme.iconsRoot + '/' + name + '.svg'
                    else
                        return Material.Theme.iconsRoot + '/' + name.replace('/', '_') + '.svg'
                } else {
                    return ""
                }
            } else {
                return icon.source
            }
        }

        sourceSize {
            width: size * Screen.devicePixelRatio
            height: size * Screen.devicePixelRatio
        }
    }

    QtGraphicalEffects.ColorOverlay {
        id: overlay

        anchors.fill: parent
        source: image
        color: Material.Theme.alpha(icon.color, 1)
        cached: true
        visible: image.source != "" && colorize
        opacity: icon.color.a
    }

    Material.AwesomeIcon {
        id: awesomeIcon

        anchors.centerIn: parent
        size: icon.size * 0.9
        visible: name != ""
        color: icon.color

        name: {
            if (icon.source.indexOf("icon://awesome/") == 0) {
                return icon.source.substring(15)
            } else {
                return ''
            }
        }
    }
}
