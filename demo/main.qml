import QtQuick 2.4
import Material 0.3 as Material
import Material.ListItems 0.1 as MaterialListItem

Material.ApplicationWindow {
    id: demo

    title: "Material for QtQuick Demo"

    // Necessary when loading the window from C++
    visible: true

    theme {
        primaryColor: "blue"
        accentColor: "red"
        tabHighlightColor: "white"
    }

    property var styles: [
            "Custom Icons", "Color Palette", "Typography"
    ]

    property var basicComponents: [
            "Button", "CheckBox", "Progress Bar", "Radio Button",
            "Slider", "Switch", "TextField"
    ]

    property var compoundComponents: [
            "Bottom Sheet", "Dialog", "Forms", "List Items", "Page Stack", "Time Picker", "Date Picker"
    ]

    property var sections: [ basicComponents, styles, compoundComponents ]

    property var sectionTitles: [ "Basic Components", "Style", "Compound Components" ]

    property string selectedComponent: sections[0][0]

    initialPage: Material.TabbedPage {
        id: page

        title: "Demo"

        actionBar.maxActionCount: navDrawer.enabled ? 3 : 4

        actions: [
            Material.Action {
                iconName: "alert/warning"
                name: "Dummy error"
                onTriggered: demo.showError("Something went wrong", "Do you want to retry?", "Close", true)
            },

            Material.Action {
                iconName: "image/color_lens"
                name: "Colors"
                onTriggered: colorPicker.show()
            },

            Material.Action {
                iconName: "action/settings"
                name: "Settings"
                hoverAnimation: true
            },

            Material.Action {
                iconName: "alert/warning"
                name: "THIS SHOULD BE HIDDEN!"
                visible: false
            },

            Material.Action {
                iconName: "action/language"
                name: "Language"
                enabled: false
            },

            Material.Action {
                iconName: "action/account_circle"
                name: "Accounts"
            }
        ]

        backAction: navDrawer.action

        Material.NavigationDrawer {
            id: navDrawer

            enabled: page.width < dp(500)

            onEnabledChanged: smallLoader.active = enabled

            Flickable {
                anchors.fill: parent

                contentHeight: Math.max(content.implicitHeight, height)

                Column {
                    id: content
                    anchors.fill: parent

                    Repeater {
                        model: sections

                        delegate: Column {
                            width: parent.width

                            MaterialListItem.Subheader {
                                text: sectionTitles[index]
                            }

                            Repeater {
                                model: modelData
                                delegate: MaterialListItem.Standard {
                                    text: modelData
                                    selected: modelData == demo.selectedComponent
                                    onClicked: {
                                        demo.selectedComponent = modelData
                                        navDrawer.close()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        Repeater {
            model: !navDrawer.enabled ? sections : 0

            delegate: Material.Tab {
                title: sectionTitles[index]

                property string selectedComponent: modelData[0]
                property var section: modelData

                sourceComponent: tabDelegate
            }
        }

        Loader {
            id: smallLoader
            anchors.fill: parent
            sourceComponent: tabDelegate

            property var section: []
            visible: active
            active: false
        }
    }

    Material.Dialog {
        id: colorPicker
        title: "Pick color"

        positiveButtonText: "Done"

        Material.MenuField {
            id: selection
            model: ["Primary color", "Accent color", "Background color"]
            width: dp(160)
        }

        Grid {
            columns: 7
            spacing: dp(8)

            Repeater {
                model: [
                    "red", "pink", "purple", "deepPurple", "indigo",
                    "blue", "lightBlue", "cyan", "teal", "green",
                    "lightGreen", "lime", "yellow", "amber", "orange",
                    "deepOrange", "grey", "blueGrey", "brown", "black",
                    "white"
                ]

                Rectangle {
                    width: dp(30)
                    height: dp(30)
                    radius: dp(2)
                    color: Material.Palette.colors[modelData]["500"]
                    border.width: modelData === "white" ? dp(2) : 0
                    border.color: Material.Theme.alpha("#000", 0.26)

                    Material.Ink {
                        anchors.fill: parent

                        onPressed: {
                            switch(selection.selectedIndex) {
                                case 0:
                                    theme.primaryColor = parent.color
                                    break;
                                case 1:
                                    theme.accentColor = parent.color
                                    break;
                                case 2:
                                    theme.backgroundColor = parent.color
                                    break;
                            }
                        }
                    }
                }
            }
        }

        onRejected: {
            // TODO set default colors again but we currently don't know what that is
        }
    }

    Component {
        id: tabDelegate

        Item {

            Material.Sidebar {
                id: sidebar

                expanded: !navDrawer.enabled

                Column {
                    width: parent.width

                    Repeater {
                        model: section
                        delegate: MaterialListItem.Standard {
                            text: modelData
                            selected: modelData == selectedComponent
                            onClicked: selectedComponent = modelData
                        }
                    }
                }
            }
            Flickable {
                id: flickable
                anchors {
                    left: sidebar.right
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                }
                clip: true
                contentHeight: Math.max(example.implicitHeight + 40, height)
                Loader {
                    id: example
                    anchors.fill: parent
                    asynchronous: true
                    visible: status == Loader.Ready
                    // selectedComponent will always be valid, as it defaults to the first component
                    source: {
                        if (navDrawer.enabled) {
                            return Qt.resolvedUrl("%1Demo.qml").arg(demo.selectedComponent.replace(" ", ""))
                        } else {
                            return Qt.resolvedUrl("%1Demo.qml").arg(selectedComponent.replace(" ", ""))
                        }
                    }
                }

                Material.ProgressCircle {
                    anchors.centerIn: parent
                    visible: example.status == Loader.Loading
                }
            }
            Material.Scrollbar {
                flickableItem: flickable
            }
        }
    }
}
