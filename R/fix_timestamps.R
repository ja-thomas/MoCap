#'Fix missing timestamps
#'
#'Fix missing timestamps in situations where a camera didn't recognice a person
#'
#'@param ensemble A camera cast ensemble object, created by read_motion_data 
#'(or create_camera_cast_ensemble)
#'@author Janek
#'@encoding UTF-8
#'@export
fix_timestamps <- function(ensemble){
  for(s in seq_len(length(ensemble$sensorIds))){
    missing_timestamps <- which(vapply(ensemble$casts[[s]]$data, 
                                       function(i) is.na(i$timestamp), logical(1)))
    
    for(m in missing_timestamps){
      correct_timestamp <- unique(vapply(ensemble$casts, 
                                         function(i) i$data[[m]]$timestamp, 
                                         numeric(1)))
      correct_timestamp <- correct_timestamp[!is.na(correct_timestamp)]
      if(length(correct_timestamp) == 0){
        warning("no timestamp in frame", m)
      }
      else if(length(correct_timestamp) > 1){
        stop("camera casts do not match in frame", m)
      }
      else{
        ensemble$casts[[s]]$data[[m]]$timestamp <- correct_timestamp
      }
      
    }    
  }
  ensemble
}