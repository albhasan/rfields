#' The FIELD class
#'
#' Use this class for representing fields
#'
#'
#'@section Slots :
#' \describe{
#' \item{\code{extent}:}{Object of class \code{"Extent"}, extent of the Field object.}
#' \item{\code{position}:}{Object of class \code{"Position"}, hold the positions of the Field object.}
#' \item{\code{value}:}{Object of class \code{"Value"}, holds the values of the Field object.}
#' \item{\code{estimator}:}{Object of class \code{"Estimator"}, estimator of the Field object.}
#' }
#'
#' @note No notes
#' @name Field
#' @aliases Field-class
#' @exportClass Field
#' @author Alber Sanchez
setClass (
  Class = "Field",
  representation = representation(
    extent = "Extent",
    position = "Position",
    value = "Value",
    estimator = "Estimator"
  ),
  validity = function(object){
    #cat("~~~ ValueReduct: inspector ~~~ \n")
    E <- object@extent
    P <- object@position
    V <- object@value
    G <- object@estimator
    if(is.null(E) || is.null(G)){
      stop ("[Field: extent or estimator are NULL")
    }else{}
    return(TRUE)
  }
)



#*******************************************************
#CONSTRUCTOR
#*******************************************************