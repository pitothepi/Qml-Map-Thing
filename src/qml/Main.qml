import QtQuick
import QtQuick.Effects
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

    RowLayout {
        anchors.fill: parent
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ControllableMap {
                id: map
                anchors.fill: parent
                anchors.margins: root.margin

                plugin: Plugin {
                    name: "osm"
                }
                center: QtPositioning.coordinate(59.91, 10.75) // Oslo
                zoomLevel: 14
            }
            MultiEffect {
                source: map
                anchors.fill: map
                shadowBlur: 1.0
                shadowEnabled: true
                shadowColor: "black"
                shadowVerticalOffset: 5
                shadowHorizontalOffset: 5
            }
        }
        Rectangle {
            id: textRect
            width: childrenRect.width + root.margin
            height: childrenRect.height + root.margin
            color: none
            ColumnLayout {
                id: helloTextBox
                Text {
                    text: "Hello\nWorld"
                }
            }

            MultiEffect {
                source: helloTextBox
                anchors.fill: helloTextBox
                shadowBlur: 1.0
                shadowEnabled: true
                shadowColor: "black"
                shadowVerticalOffset: 5
                shadowHorizontalOffset: 5
            }
        }
    }
}
