#'Create a skeleton Object
#'
#'create skeleton object, which is one picture of one camera (for internal use
#'mostly)
#'
#'
#'@param skeleton list of elements to create a skeleton object
#'@author Janek
#'@encoding UTF-8
create_skeleton_object <- function(skeleton){
  
  skeleton_object <- list()
  skeleton_object$isOptitrack <- NA
  skeleton_object$sensorId <- NA
  skeleton_object$sourceTrackId <- NA
  skeleton_object$timestamp <- NA
  
  skeleton_object$joints <- data.frame(Key = 0:24, 
                                       Value.Error = factor(rep(NA, 25),
                                                    levels = c("0", "10", "99"), 
                               labels = c("tracked", "limited", "not_tracked")),
                                       Value.position.X = rep(NA, 25),
                                       Value.position.Y = rep(NA, 25),
                                       Value.position.Z = rep(NA, 25))
  
  skeleton_object$error <- NA
  
  if(!is.null(skeleton)){
    
    skeleton_object$isOptitrack <- skeleton$isOptitrack
    skeleton_object$sensorId <- skeleton$sensorId 
    skeleton_object$sourceTrackId <- skeleton$sourceTrackId
    skeleton_object$timestamp <- skeleton$timestamp
    
    skeleton_object$joints <- as.data.frame(t(sapply(seq_len(length(
      skeleton$RawSkeleton$Joints)), function(i) 
        unlist(skeleton$RawSkeleton$Joints[[i]]))))
    
    skeleton_object$joints$Value.Error <- factor(
      skeleton_object$joints$Value.Error, levels = c("0", "10", "99"), 
             labels = c("tracked", "limited", "not_tracked"))
    
    skeleton_object$error <- skeleton$RawSkeleton$error
  }
  
  class(skeleton_object) <- c("skeleton")
  skeleton_object
}