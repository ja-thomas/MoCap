#'Select one joint from a camera cast
#'
#'Select one joint from a camera cast object. 
#'
#'
#'@param cast camera cast object
#'@param joint numeric. Integer of the joint number to extract
#'@author Janek
#'@encoding UTF-8
#'@export
select_joint <- function(cast, joint){
  
  do.call(rbind, lapply(cast$data, function(i)
    cbind(i$joints[i$joints$Key == 1, 3:5], timestamp = i$timestamp)))
}




 



