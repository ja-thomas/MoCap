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
  
  distance <- sqrt((data$Value.position.X.x - data$Value.position.X.y)^2 + 
    (data$Value.position.Y.x - data$Value.position.Y.y)^2 +
    (data$Value.position.Z.x - data$Value.position.Z.y)^2)
    
  data.table(distance, joint_Nr = joint, timestamp = data$timestamp, person, 
              course, kinect_error = data$Value.Error, 
             x = data$Value.position.X.x, y = data$Value.position.Y.x,
             z = data$Value.position.Z.x, key = c("joint_Nr", "timestamp", 
                                                  "person", "course"))
  
}




