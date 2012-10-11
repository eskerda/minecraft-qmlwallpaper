import QtQuick 1.0
import "ellipsis.js" as Ellipsis

Rectangle {
  id: root
  width: 1024; height: 768
  gradient: Gradient {
    GradientStop { position: 0.0; color: '#0B0F12' }
    GradientStop { position: 1.0; color: '#121621' }
  }
  
  Moon {
    id: moon
    width: root.width / 10 // This assumes width > height (usual resolutions) 
    height: root.width / 10
  }
  
  property int step: 0
  
  function startup() {
    
  }
  
  function update() {
      step+=1;
      console.log(step);
  }
  
  Component.onCompleted: startup();
  
  Timer {
    running: true
    repeat: true
    interval: 1000 
    onTriggered: update()
  }
}