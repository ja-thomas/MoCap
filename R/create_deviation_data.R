#'Create a Data.table of the Deviation
#'
#'Create a Data.table of the deviation of one kinect to the optitrack
#'
#'@param joint numeric. Joint ID from 0 to 24
#'@param joint_positions  camera_cast object of one Kinect
#'@param optitrack_positions camera_cast object of the corresponding Kinect
#'@param person character. Name (or number of the person)
#'@param course character. Name of the course
#'@author Janek
#'@encoding UTF-8
#'@export
#'@import data.table

create_deviation_data <- function(joint ,joint_positions, optitrack_positions,
                                  person = NULL, course = NULL){
  
  joints <- select_joint(joint_positions, joint, include_error = TRUE)
  optitrack <- select_joint(optitrack_positions, joint)
  
  data <- data.table(merge(joints, optitrack, by = "timestamp"))
  
  deviation_x <- data$Value.position.X.x - data$Value.position.X.y
  deviation_y <- data$Value.position.Y.x - data$Value.position.Y.y
  deviation_z <- data$Value.position.Z.x - data$Value.position.Z.y
  
  deviation <- sqrt(deviation_x^2 + deviation_y^2 + deviation_z^2)
    
  data.table(deviation, deviation_x, deviation_y, deviation_z, 
             timestamp = data$timestamp, joint_Nr = joint,
             sensorId = joint_positions$sensorId, person, course, 
             key = c("joint_Nr", "timestamp", "person", "course", "sensorId"))
  
}




