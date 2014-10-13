#' The ESTIMATOR class
#'
#' Use this class for representing a Field object's estimator.
#'
#'
#'@section Slots :
#' \describe{
#' \item{\code{knownPosition}:}{Object of class \code{"Position"}, hold the positions of the Field object to be accounted during estimation.}
#' \item{\code{value}:}{Object of class \code{"Value"}, hold the value of the known positions.}
#' \item{\code{unknownPosition}:}{Object of class \code{"Position"}, hold the positions of the Field object to be estimated.}
#' }
#'
#' @note No notes
#' @name Estimator
#' @aliases Estimator-class
#' @exportClass Estimator
#' @author Alber Sanchez
setClass (
  Class = "Estimator",
  representation = representation(
    knownPosition = "Position",
    value = "Value",
    unknownPosition = "Position"
  ),
  validity = function(object){
    #cat("~~~ ValueReduct: inspector ~~~ \n")
    P <- object@knownPosition
    V <- object@value
    UP <- object@unknownPosition
    #if(is.null(P) || is.null(V)){
    #  stop ("[Estimator: extent or estimator are NULL")
    #}else{}
    return(TRUE)
  }
)


#*******************************************************
#CONSTRUCTOR
#*******************************************************