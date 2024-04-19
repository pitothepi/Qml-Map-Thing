import QtQuick
import QtQuick.Effects
import QtLocation
import QtPositioning
import QtQuick.Layouts

Window {
    id: root

    property int margin: 5

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    RowLayout {
        anchors.fill: parent
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ControllableMap {
                id: map
                anchors.fill: parent
                anchors.margins: 5

                plugin: Plugin {
                    name: "osm"
                }
                center: QtPositioning.coordinate(59.91, 10.75) // Oslo
                zoomLevel: 14
            }
        }
        Rectangle {
            id: textRect
            width: childrenRect.width + root.margin
            height: childrenRect.height + root.margin
            ColumnLayout {

                Text {
                    text: "hello"
                    MultiEffect {                               // TODO: this doesn't work
                        source: text
                        anchors.fill: textRect
                        shadowBlur: 1.0
                        shadowEnabled: true
                        shadowColor: "black"
                        shadowVerticalOffset: 2
                        shadowHorizontalOffset: 2
                    }
                }
            }
        }
    }
}
