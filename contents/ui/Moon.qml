import QtQuick 1.0

Astro {
  id: moon
  source: 'assets/moon/moon.png'
  asset_width: 8
  asset_height: 8
  property int phase
  property int n_phases: 8

  onPhaseChanged: {
    source = 'assets/moon/sprites/'+phase+".png";
  }

  function setPhase( now ) { 
    
    /**
     * Simple algorithm to compute moon's phase
     * 
     * This simply mods the difference between the date an
     * a known new moon date (1970-01-07) by the length of
     * the lunar period. For this reason, it is only valid
     * from 1970 onwards
     * 
     * Source: http://ben-daglish.net/moon.shtml
    */
    
    var lp = 2551443;                        
    var new_moon = new Date(1970, 0, 7, 20, 35, 0);
    var phase_seconds = ((now.getTime() - new_moon.getTime())/1000) % lp;
    var phase_day = Math.floor(phase_seconds /(24*3600));
    phase = Math.floor(phase_day / (30 / n_phases));
  }
}