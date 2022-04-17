/***** THIS FILE CANNOT BE RELICENSED UNDER THE MPL YET *****/

/*
 * QML Material - An application framework implementing Material Design.
 * Copyright (C) 2015 Michael Spencer <sonrisesoftware@gmail.com>
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
import QtQuick.Layouts 1.1

import Material 0.3 as Material
import Material.ListItems 0.1

/*!
   \qmltype MenuField
   \inqmlmodule Material

   \brief A input field similar to a text field but that opens a dropdown menu.
 */
Item {
    id: field

    implicitHeight: hasHelperText ? helperTextLabel.y + helperTextLabel.height + 4 * Material.Units.dp
                                  : underline.y + 8 * Material.Units.dp
    implicitWidth: spinBoxContents.implicitWidth

    activeFocusOnTab: true

    property color accentColor: Material.Theme.accentColor
    property color errorColor: "#F44336"

    property alias model: listView.model

    property string textRole

    readonly property string selectedText: (listView.currentItem) ? listView.currentItem.text : ""

    property alias selectedIndex: listView.currentIndex
    property int maxVisibleItems: 4

    property alias placeholderText: fieldPlaceholder.text
    property alias helperText: helperTextLabel.text

    property bool floatingLabel: false
    property bool hasError: false
    property bool hasHelperText: helperText.length > 0

    readonly property rect inputRect: Qt.rect(spinBox.x, spinBox.y, spinBox.width, spinBox.height)

    signal itemSelected(int index)

    Material.Ink {
        anchors.fill: parent
        onClicked: {
            listView.positionViewAtIndex(listView.currentIndex, ListView.Center)
            var offset = listView.currentItem.itemLabel.mapToItem(menu, 0, 0)
            menu.open(label, 0, -offset.y)
        }
    }

    Item {
        id: spinBox

        height: 24 * Material.Units.dp
        width: parent.width

        y: {
            if(!floatingLabel)
                return 16 * Material.Units.dp
            if(floatingLabel && !hasHelperText)
                return 40 * Material.Units.dp
            return 28 * Material.Units.dp
        }

        RowLayout {
            id: spinBoxContents

            height: parent.height
            width: parent.width + 5 * Material.Units.dp

            Material.Label {
                id: label

                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter

                text: (listView.currentItem) ? listView.currentItem.text : ""
                style: "subheading"
                elide: Text.ElideRight
            }

            Material.Icon {
                id: dropDownIcon

                Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
                Layout.preferredWidth: 24 * Material.Units.dp
                Layout.preferredHeight: 24 * Material.Units.dp

                name: "navigation/arrow_drop_down"
                size: 24 * Material.Units.dp
            }
        }

        Material.Dropdown {
            id: menu

            anchor: Item.TopLeft

            width: spinBox.width

            //If there are more than max items, show an extra half item so
            // it's clear the user can scroll
            height: Math.min(maxVisibleItems*48 * Material.Units.dp + 24 * Material.Units.dp, listView.contentHeight)

            ListView {
                id: listView

                width: menu.width
                height: count > 0 ? menu.height : 0

                interactive: true

                delegate: Standard {
                    id: delegateItem

                    text: textRole ? model[textRole] : modelData

                    onClicked: {
                        itemSelected(index)
                        listView.currentIndex = index
                        menu.close()
                    }
                }
            }

            Material.Scrollbar {
                flickableItem: listView
            }
        }
    }

    Material.Label {
        id: fieldPlaceholder

        text: field.placeholderText
        visible: floatingLabel

        font.pixelSize: 12 * Material.Units.dp

        anchors.bottom: spinBox.top
        anchors.bottomMargin: 8 * Material.Units.dp

        color: Material.Theme.light.hintColor
    }

    Rectangle {
        id: underline

        color: field.hasError ? field.errorColor : field.activeFocus ? field.accentColor : Material.Theme.light.hintColor

        height: field.activeFocus ? 2 * Material.Units.dp : 1 * Material.Units.dp

        anchors {
            left: parent.left
            right: parent.right
            top: spinBox.bottom
            topMargin: 8 * Material.Units.dp
        }

        Behavior on height {
            NumberAnimation { duration: 200 }
        }

        Behavior on color {
            ColorAnimation { duration: 200 }
        }
    }

    Material.Label {
        id: helperTextLabel

        anchors {
            left: parent.left
            right: parent.right
            top: underline.top
            topMargin: 4 * Material.Units.dp
        }

        visible: hasHelperText
        font.pixelSize: 12 * Material.Units.dp
        color: field.hasError ? field.errorColor : Qt.darker(Material.Theme.light.hintColor)

        Behavior on color {
            ColorAnimation { duration: 200 }
        }
    }
}
