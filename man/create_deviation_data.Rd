% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/create_deviation_data.R
\encoding{UTF-8}
\name{create_deviation_data}
\alias{create_deviation_data}
\title{Create a Data.table of the Deviation}
\usage{
create_deviation_data(joint, joint_positions, optitrack_positions,
  person = NULL, course = NULL)
}
\arguments{
\item{joint}{numeric. Joint ID from 0 to 24}

\item{joint_positions}{camera_cast object of one Kinect}

\item{optitrack_positions}{camera_cast object of the corresponding Kinect}

\item{person}{character. Name (or number of the person)}

\item{course}{character. Name of the course}
}
\description{
Create a Data.table of the deviation of one kinect to the optitrack
}
\author{
Janek
}

