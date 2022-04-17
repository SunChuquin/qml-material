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

QuickControlsStyle.ToolBarStyle {
	padding {
        left: 16 * Material.Units.dp
        right: 16 * Material.Units.dp
        top: 0 * Material.Units.dp
        bottom: 0 * Material.Units.dp
    }
    background: Material.View {
        implicitHeight: Material.Device.type == Material.Device.phone || Material.Device.type === Material.Device.phablet
                ? 48 * Material.Units.dp : Material.Device.type == Material.Device.tablet ? 56 * Material.Units.dp : 64 * Material.Units.dp
        fullWidth: true
        elevation: 2

        backgroundColor: Material.Theme.primaryColor
    }
}
