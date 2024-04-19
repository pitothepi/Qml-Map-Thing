import QtQuick
import QtQuick.Controls
import QtLocation
import QtPositioning
import QtQuick.Layouts

Window {
    id: root

    property int margin: 10

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ControllableMap {
        id: map

        anchors.fill: parent

        plugin: Plugin {
            name: "osm"
        }

        center: QtPositioning.coordinate(59.91, 10.75) // Oslo
        zoomLevel: 14
    }

    ColumnLayout {
        id: rightMenu
        anchors.right: map.right
        anchors.top: map.top
        anchors.margins: root.margin

        width: childrenRect.width
        height: childrenRect.height

        spacing: root.margin

        ShadowBox {
            Control {
                padding: 5
                contentItem: Text {
                    id: jawn
                    text: "Hello\nWorld"
                }
            }
        }

        ShadowBox {
            Control {
                padding: 5
                contentItem: ComboBox {
                    id: mapTypeCombobox

                    model: map.supportedMapTypes
                    textRole: "name"
                    implicitContentWidthPolicy: ComboBox.WidestText

                    onCurrentIndexChanged: map.activeMapType = map.supportedMapTypes[ mapTypeCombobox.currentIndex ]
                }
            }
        }
    }
}
