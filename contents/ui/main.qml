import QtQuick 1.0

Rectangle {
  id: root
  width: 1024; height: 768
  gradient: Gradient {
    GradientStop { position: 0.0; color: '#0B0F12' }
    GradientStop { position: 1.0; color: '#121621' }
  }
  property real time_alpha: getTimeAlpha(new Date())

  function getTimeAlpha( date ){
    return ((date.getHours() * 60) + date.getMinutes()) * 2 * Math.PI / (24 * 60)
  }

  Timer {
    running: true
    repeat: true
    interval: 1000 * 60
    onTriggered: time_alpha = getTimeAlpha(new Date())
  }

  Moon {
    id: moon
    width: root.width / 10 // This assumes width > height (usual resolutions) 
    height: root.width / 10
    
    x: moon_pos.x - moon.width / 2
    y: moon_pos.y - moon.width / 2

    Ellipse {
      id: moon_pos
      verticalRadius: root.height / 2 - moon.height
      horizontalRadius: root.width / 2
      center_x: root.width / 2
      center_y: root.height / 2
      displacement: 5 * Math.PI / 4
      alpha: time_alpha
    }
  }

  Astro {
    id: sun
    source: 'assets/sun.png'
    width: root.width / 10 // This assumes width > height (usual resolutions) 
    height: root.width / 10
    asset_width: 8
    asset_height: 8
    
    x: sun_pos.x - sun.width / 2
    y: sun_pos.y - sun.width / 2

    Ellipse {
      id: sun_pos
      verticalRadius: root.height / 2 - sun.height
      horizontalRadius: root.width / 2
      center_x: root.width / 2
      center_y: root.height / 2
      displacement: Math.PI / 4
      alpha: time_alpha
    }
  }
}