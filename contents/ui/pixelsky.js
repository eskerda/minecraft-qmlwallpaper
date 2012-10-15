var debug = true;
var init = function(){
    if (debug){
        console.log("Debug mode ON");
        root.debug = true;
        root.interval = 100;
        root.debug_time = 1000 * 60 * 5;
    }
}
