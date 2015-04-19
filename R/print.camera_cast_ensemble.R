#'print camera cast ensemble
#'
#'
#'@author Janek
#'@encoding UTF-8
#'
print.camera_cast_ensemble <- function(object){
  number_optitrack <- sum(object$sensorIds == "OPTITRACK")
  number_kinect <- length(object$sensorIds) - number_optitrack
  
  print(paste(object$n_observations , "observations by", number_kinect, 
        "Kinect(s) and", number_optitrack, "Optitrack System"))
}