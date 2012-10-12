import QtQuick 1.0

Astro {
  id: moon
  source: 'assets/moon/moon.png'
  asset_width: 8
  asset_height: 8
  property int phase: 0
  property int n_phases: 9

  onPhaseChanged: {
    source = 'assets/moon/sprites/'+phase % n_phases+".png";
  }
}
