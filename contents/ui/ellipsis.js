.pragma library

function get_alpha(ellipsis_x, h, a){
    return Math.acos((ellipsis_x-h)/a);
}
  
function get_ellipsis_x(k, b, alpha){
    return k + b * Math.sin(alpha);
}