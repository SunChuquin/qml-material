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
import QtQuick.Window 2.2 as QuickWindow

/*!
   \qmltype Window
   \inqmlmodule Material

   \brief A subclass of QtQuick.Window that provides some additional features for developing Applications
   that conform to Material Design.

   Here is a short working example of an application:

   \qml
   import QtQuick 2.4
   import Material 0.3

   Window {
       title: "Application Name"
   }
   \endqml
*/
QuickWindow.Window {
    id: window

    /*!
       \qmlproperty AppTheme theme

       A grouped property that allows the application to customize the the primary color, the
       primary dark color, and the accent color. See \l Theme for more details.
     */
    property alias theme: __theme

    Material.PlatformExtensions {
        id: platformExtensions
        decorationColor: Material.Theme.primaryDarkColor
        window: window
    }

    Material.AppTheme {
        id: __theme
    }

    Material.OverlayLayer {
        id: dialogOverlayLayer
        objectName: "dialogOverlayLayer"
    }

    Material.OverlayLayer {
        id: tooltipOverlayLayer
        objectName: "tooltipOverlayLayer"
    }

    Material.OverlayLayer {
        id: overlayLayer
    }

    width: dp(800)
    height: dp(600)

    // Units

    function dp(dp) {
        return dp * Material.Units.dp
    }

    function gu(gu) {
        return units.gu(gu)
    }

    Material.UnitsHelper {
        id: units
    }
}
