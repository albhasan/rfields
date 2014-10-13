#' The POSITION class
#'
#' Use this class for representing a Field object's positions.
#'
#'
#'@section Slots :
#' \describe{
#' \item{\code{coords}:}{Object of class \code{"list"}, coordinates of a position object.}
#' }
#'
#' @note No notes
#' @name Position
#' @aliases Position-class
#' @exportClass Position
#' @author Alber Sanchez
setClass (
  Class = "Position",
  representation = representation(
    coords = "numeric"
  ),
  validity = function(object){
    #cat("~~~ ValueReduct: inspector ~~~ \n")
    coords <- object@coords
    if(is.null(coords)){
      stop ("[Position: coords is NULL")
    }else{}
    return(TRUE)
  }
)


#*******************************************************
#CONSTRUCTOR
#*******************************************************