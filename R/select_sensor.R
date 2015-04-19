#'Select sensor from cast esemble
#'
#'
#'Select one sensor from a camera cast esemble
#'
#'
#'@param ensemble camera_cast_ensemble object
#'@param sensor Integer value or sensorId
#'
#'@author Janek
#'@encoding UTF-8
#'@export
select_sensor <- function(ensemble, sensor){
  if(!is.numeric(sensor)){
    
    sensor <- which(ensemble$sensorIds == sensor)
    
    if(length(sensor)==0){
      stop("unknown sensor ID")
    }
  }
  
  ensemble$casts[[sensor]]  
}