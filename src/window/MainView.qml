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
import QtQuick.Window 2.2
import Material 0.3 as Material

/*!
   \qmltype MainView
   \inqmlmodule Material

   \brief A root component with support for overlays and configuring the app theme.
 */
Item {
    id: mainView

    /*!
       \qmlproperty AppTheme theme

       A grouped property that allows the application to customize the the primary color, the
       primary dark color, and the accent color. See \l Theme for more details.
     */
    property alias theme: __theme

    Material.AppTheme {
        id: __theme
    }

    Material.PlatformExtensions {
        id: platformExtensions
    }

    Material.OverlayLayer {
        id: dialogOverlayLayer
        objectName: "dialogOverlayLayer"
        z: 100
    }

    Material.OverlayLayer {
        id: tooltipOverlayLayer
        objectName: "tooltipOverlayLayer"
        z: 100
    }

    Material.OverlayLayer {
        id: overlayLayer
        z: 100
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
