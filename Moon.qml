import QtQuick 1.0

Item {
  Image {
    id: moonAsset
    source: 'assets/moon.svg'
    z: 1
    anchors.fill: parent
    smooth: false
  }
  
  Image {
    id: moonLight
    source: 'assets/moon_light.png'
    width: moonAsset.width * 1.5; height: moonAsset.height * 1.5
    anchors.horizontalCenter: moonAsset.horizontalCenter
    anchors.verticalCenter: moonAsset.verticalCenter
    z: 1
    opacity: 1
  }
  
  Behavior on x { NumberAnimation { duration: 1000; easing.type: Easing.InQuad } }
  Behavior on y { NumberAnimation { duration: 1000; easing.type: Easing.InQuad } }

  function update(){
      x = Math.random()*1024
  }
}