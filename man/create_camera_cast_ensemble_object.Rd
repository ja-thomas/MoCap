% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/create_camera_cast_ensemble_object.R
\encoding{UTF-8}
\name{create_camera_cast_ensemble_object}
\alias{create_camera_cast_ensemble_object}
\title{Create a camera cast ensemble object}
\usage{
create_camera_cast_ensemble_object(ensemble, fix_timestamps = TRUE)
}
\arguments{
\item{ensemble}{list of list of lists, generated by reading in the JSON file,
use read_motion_data to read in a JSON file and convert to to a ensemble}

\item{fix_timestamps}{logical. Should missing timestamps in situations where
a camera didn't register anything be added.}
}
\description{
Create a camera cast ensemble object which is one or more camera casts, of the
same situation with identical timestamps
}
\author{
Janek
}

