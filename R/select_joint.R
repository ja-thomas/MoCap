#'Select one joint from a camera cast
#'
#'Select one joint from a camera cast object. 
#'
#'
#'@param cast camera cast object
#'@param joint numeric. Integer of the joint number to extract
#'@param include_error logical. Should the kinect specific error value be included
#'@author Janek
#'@encoding UTF-8
#'@export
select_joint <- function(cast, joint, include_error = FALSE){
  
  selected <- c("Value.position.X", "Value.position.Y", "Value.position.Z")
  
  if(include_error & cast$sensorId != "OPTITRACK"){
    selected <- c(selected, "Value.Error")
  }
  
  do.call(rbind, lapply(cast$data, function(i)
    cbind(i$joints[i$joints$Key == 1, selected], timestamp = i$timestamp)))
}




 



