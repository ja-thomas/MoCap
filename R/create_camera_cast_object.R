#'Create a camera cast object
#'
#'create camera cast object, which is a list of skeletons of one camera 
#'(for internal use mostly)
#'
#'
#'@param skeleton_list list of lists where every list element can be coerced to 
#'a skeleton object
#'@param sensorId character string of sensorId
#'@author Janek
#'@encoding UTF-8
create_camera_cast_object <- function(skeleton_list, sensorId){
  camera_cast <- list()
  
  find_sensorId <- function(moment, sensorId){
    sensors <- vapply(moment, function(i) i$sensorId, character(1))
    
    position <- which(sensors == sensorId)
    
    if(length(position) == 0){
      return(NA)
    }
    else if(length(position) > 1){
      stop(paste("not distinct sensor ID, timestamp:", moment[[1]]$timestamp))
    }
    else{
      return(position)
    }
  }
  
  camera_cast$data <- lapply(skeleton_list, function(i) create_skeleton_object(
    i[[find_sensorId(i, sensorId)]]))
  
  camera_cast$n <- length(camera_cast$data)
  
  sensorId <- unique(sapply(camera_cast$data, function(i) i$sensorId))
  sensorId <- sensorId[!is.na(sensorId)]
  
  if(length(sensorId) == 1){
    camera_cast$sensorId <- sensorId
  }
  else{
    stop("different camera IDs in one camera cast:", sensorId)
  }
  
  isOptitrack <- unique(sapply(camera_cast$data, 
                               function(i) i$isOptitrack))
  isOptitrack <- isOptitrack[!is.na(isOptitrack)]
  
  if(length(isOptitrack) == 1){
    camera_cast$isOptitrack <- isOptitrack
  }
  else{
    stop("Mixed Optitrack and Kinect data in one camera cast")
  }
  
  class(camera_cast) <- c("camera_cast")
  camera_cast
  
}