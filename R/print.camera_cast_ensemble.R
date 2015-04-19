#'print camera cast ensemble
#'
#'print camera cast ensemble objects
#'
#'@param x camera_cast_ensemble object
#'@param ... further arguments passed to print
#'@author Janek
#'@encoding UTF-8
#'@export
print.camera_cast_ensemble <- function(x, ...){
  number_optitrack <- sum(x$sensorIds == "OPTITRACK")
  number_kinect <- length(x$sensorIds) - number_optitrack
  
  print(paste(x$n_observations , "observations by", number_kinect, 
        "Kinect(s) and", number_optitrack, "Optitrack System"))
}