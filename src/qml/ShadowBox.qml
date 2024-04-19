import QtQuick
import QtQuick.Effects

Item {
    default property alias content: backgroundRect.children
    property alias backgroundColor: backgroundRect.color
    property alias rect: backgroundRect

    width: dropShadow.width
    height: dropShadow.height

    Rectangle {
        id: backgroundRect
        color: "#FDFDFD"
        width: childrenRect.width
        height: childrenRect.height
    }

    MultiEffect {
        id: dropShadow
        source: backgroundRect
        anchors.fill: source
        shadowBlur: 1.0
        shadowEnabled: true
        shadowColor: "black"
        shadowVerticalOffset: 5
        shadowHorizontalOffset: 5
    }
}
