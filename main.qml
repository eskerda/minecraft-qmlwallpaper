import QtQuick 1.0

Rectangle {
  id: root
  width: 1024; height: 768
  gradient: Gradient {
    GradientStop { position: 0.0; color: '#0B0F12' }
    GradientStop { position: 1.0; color: '#121621' }
  }
  
  Moon {
    id: moon
    width: root.width / 5
    height: root.width / 5
  }
  
  Timer {
    running: true
    repeat: true
    interval: 1000
    onTriggered: moon.update()
  }
}