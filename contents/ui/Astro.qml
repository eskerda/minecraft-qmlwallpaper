import QtQuick 1.0

Item {
  id: astro
  property alias source: astroAsset.source

  Image {
    id: astroAsset
    z: 1
    anchors.fill: parent
    smooth: false
    fillMode: Image.PreserveAspectCrop
    width: 8
    height: 8
  }
  
  Image {
    id: astroLight
    source: 'assets/astro/astro_light.png'
    width: astroAsset.width * 1.5; height: astroAsset.height * 1.5
    anchors.horizontalCenter: astroAsset.horizontalCenter
    anchors.verticalCenter: astroAsset.verticalCenter
    z: 0
    opacity: 1
  }
  
  NumberAnimation { running: true; target: astro; property: "opacity"; from: 0; to: 1; duration: 750 }
}
