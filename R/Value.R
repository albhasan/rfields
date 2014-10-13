#' The VALUE class
#'
#' Use this class for representing a Field object's values.
#'
#'
#'@section Slots :
#' \describe{
#' \item{\code{value}:}{Object of class \code{"list"}, values of a Field object.}
#' }
#'
#' @note No notes
#' @name Value
#' @aliases Value-class
#' @exportClass Value
#' @author Alber Sanchez
setClass (
  Class = "Value",
  representation = representation(
    value = "list"
  ),
  validity = function(object){
    #cat("~~~ ValueReduct: inspector ~~~ \n")
    V <- object@value
    if(is.null(V)){
      stop ("[Value: value is NULL")
    }else{}
    return(TRUE)
  }
)


#*******************************************************
#CONSTRUCTOR
#*******************************************************