#'print camera cast
#'
#'print camera cast objects
#'
#'@param x camera_cast object
#'@param ... further arguments passed to print
#'@author Janek
#'@encoding UTF-8
#'@export
print.camera_cast <- function(x, ...){
  if(x$isOptitrack){
    print(paste("Optitrack System with ", x$n, "observations"))
  }else{
    print(paste0("Kinect (Id: ", x$sensorId, ") with ", x$n, " observations" ))
  }
}