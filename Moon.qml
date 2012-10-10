import QtQuick 1.0

Item {
  id: moon
  property double h: parent.width / 2;
  property double k: 0;
  property int a: parent.width / 2;
  property int b: parent.height - 80;
  property double step: 0;
  property double step_inc: parent.width / (12 * 60)
  property date start_date: new Date()
  property int minutes: start_date.getHours()/12 * 60 + start_date.getMinutes()
  property double ellipsis_x: minutes * step_inc
  property double alpha: getAlpha(ellipsis_x, h, a)
  property double ellipsis_y: parent.height - getEllipsisY(k, b, alpha)
  
  x: ellipsis_x - width / 2;
  y: ellipsis_y - height / 2;
  
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
  ParallelAnimation {
         running: true
         NumberAnimation { target: moon; property: "opacity"; from: 0; to: 1; duration: 750 }
  }
  //Behavior on x { NumberAnimation { duration: 1000; easing.type: Easing.InQuad } }
  //Behavior on y { NumberAnimation { duration: 1000; easing.type: Easing.InQuad } }
  
  function update(){
      ellipsis_x = (ellipsis_x + step_inc) % parent.width;
      minutes+=1
      alpha = getAlpha(ellipsis_x, h, a);
      ellipsis_y = parent.height - getEllipsisY(k, b, alpha);
      x = ellipsis_x - width / 2;
      y = ellipsis_y - height / 2;
  }
  
  function getAlpha(ellipsis_x, h, a){
    return Math.acos((ellipsis_x-h)/a);
  }
  
  function getEllipsisY(k, b, alpha){
    return k + b * Math.sin(alpha);
  }
  
  function getPhaseAsset(step){
    return 'assets/moon/sprites/'+step+'.png';
  }
  
  Timer {
    running: true
    repeat: true
    interval: 1000 * 60 
    onTriggered: update()
  }
}