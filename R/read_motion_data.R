#'Read in Motion Capturing Data
#'
#'Read Motion Capturing Data from Json file
#'
#'@param file Path to JSON file
#'@return Returns a camera cast ensemble object
#'@author Janek
#'@encoding UTF-8
#'@export
#'@import rjson
read_motion_data <- function(file){

  data <- rjson::fromJSON(file = file)
  
  create_camera_cast_ensemble_object(data)
  
}