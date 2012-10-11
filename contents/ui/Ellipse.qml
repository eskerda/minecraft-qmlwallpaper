import QtQuick 1.0

QtObject {
    property real center_x
    property real center_y
    
    property real verticalRadius
    property real horizontalRadius
    
    property real x: center_x - horizontalRadius * Math.cos(alpha)
    property real y: center_y - verticalRadius * Math.sin(alpha)
    property real alpha: 0
}