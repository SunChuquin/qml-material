/*
 * QML Material - An application framework implementing Material Design.
 *
 * Copyright (C) 2016 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import QtQuick 2.4
import Material 0.3 as Material

Material.Dialog {
    contentMargins: 0
    hasActions: true
    floatingActions: true

    property alias isHours: timePicker.isHours
    property alias prefer24Hour: timePicker.prefer24Hour
    signal timePicked(date timePicked)

    Material.TimePicker {
        id: timePicker
        isHours: true
        bottomMargin: 48 * Material.Units.dp
    }

    onAccepted: {
        timePicked(timePicker.getCurrentTime())
        timePicker.reset()
    }

    onRejected: {
        timePicker.reset()
    }
}
