import QtQuick 1.0
import "pixelsky.js" as PixelSky

Rectangle {
  id: root
  width: 1024; height: 768
  gradient: Gradient {
    GradientStop { position: 0.0; color: '#0B0F12' }
    GradientStop { position: 1.0; color: '#121621' }
  }

  property date now: new Date()
  property real time_alpha
  property int interval: 1000 * 60 // One minute
  property bool debug: false
  property int debug_time

  onNowChanged: {
    time_alpha = getTimeAlpha(now);
    moon.setPhase(now);
    console.log("It is now: ", now, 'alpha:', time_alpha);
  }
  
  function getTimeAlpha( date ){
    return ((date.getHours() * 60) + date.getMinutes()) * 2 * Math.PI / (24 * 60)
  }

  Timer {
    running: true
    repeat: true
    interval: root.interval
    onTriggered: {
      var oldDate  = now;
      if (root.debug === undefined || root.debug == true){
        // Pass 30 minutes...
        now = new Date(now.getTime() + root.debug_time);
      } else
        now = new Date();
    }
  }

  Moon {
    id: moon
    width: root.width / 10 // This assumes width > height (usual resolutions) 
    height: root.width / 10
    
    x: moon_pos.x - moon.width / 2
    y: moon_pos.y - moon.height / 2

    Ellipse {
      id: moon_pos
      verticalRadius: root.height - moon.height
      horizontalRadius: root.width / 2
      center_x: root.width / 2
      center_y: root.height
      displacement: 5 * Math.PI / 4
      alpha: time_alpha
    }
    
    Component.onCompleted: setPhase(now)
  }

  Astro {
    id: sun
    source: 'assets/sun.png'
    width: root.width / 10 // This assumes width > height (usual resolutions) 
    height: root.width / 10
    asset_width: 8
    asset_height: 8
    
    x: sun_pos.x - sun.width / 2
    y: sun_pos.y - sun.height / 2

    Ellipse {
      id: sun_pos
      verticalRadius: root.height - sun.height
      horizontalRadius: root.width / 2
      center_x: root.width / 2
      center_y: root.height
      displacement: Math.PI / 4
      alpha: time_alpha
    }
  }
  Component.onCompleted: {
    PixelSky.init();
  }
}