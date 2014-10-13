#' The EXTENT class
#'
#' Use this class for representing a Field object's extent.
#'
#'
#'@section Slots :
#' \describe{
#' \item{\code{minPosition}:}{Object of class \code{"Position"}, hold the minimum position of a Field object.}
#' \item{\code{maxPosition}:}{Object of class \code{"Position"}, hold the maximum position of a Field object.}
#' }
#'
#' @note No notes
#' @name Extent
#' @aliases Extent-class
#' @exportClass Extent
#' @author Alber Sanchez
setClass (
  Class = "Extent",
  representation = representation(
    minPosition = "Position",
    maxPosition = "Position"
  ),
  validity = function(object){
    #cat("~~~ ValueReduct: inspector ~~~ \n")
    min <- object@minPosition
    max <- object@maxPosition
    if(is.null(min) || is.null(max)){
      stop ("[Extent: min or max positions cannot be NULL")
    }else{}
    return(TRUE)
  }
)

#*******************************************************
#CONSTRUCTOR
#*******************************************************