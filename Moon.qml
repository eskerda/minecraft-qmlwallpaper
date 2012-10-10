import QtQuick 1.0

Item {
  property double h: parent.width / 2;
  property double k: 0;
  property int a: parent.width / 2;
  property int b: parent.height;
  property double step: 0;
  x: - width / 2;
  y: parent.height - height / 2;
  Image {
    id: moonAsset
    z: 1
    source: 'assets/moon/moon.png'
    anchors.fill: parent
    smooth: false
    fillMode: Image.PreserveAspectCrop
    width: 8
    height: 8
  }
  
  Image {
    id: moonLight
    source: 'assets/moon/moon_light.png'
    width: moonAsset.width * 1.5; height: moonAsset.height * 1.5
    anchors.horizontalCenter: moonAsset.horizontalCenter
    anchors.verticalCenter: moonAsset.verticalCenter
    z: 0
    opacity: 1
  }
  
  
  
  //Behavior on x { NumberAnimation { duration: 1000; easing.type: Easing.InQuad } }
  //Behavior on y { NumberAnimation { duration: 1000; easing.type: Easing.InQuad } }

  function update(){;
      step+= 0.1;
      var ellipsis_x = (step % parent.width);
      var alph = Math.acos((ellipsis_x-h)/a);
      var ellipsis_y = parent.height - (k + b * Math.sin(alph));
      x = ellipsis_x - width / 2;
      y = ellipsis_y - height / 2;
  }
  
  function getPhaseAsset(step){
    return 'assets/moon/sprites/'+step+'.png';
  }
  Timer {
    running: true
    repeat: true
    interval: 10
    onTriggered: update()
  }
}