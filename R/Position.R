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
    coords = "list"
  ),
  validity = function(object){
    cat("~~~ Position: inspector ~~~ \n")
    coords <- object@coords
    if(is.null(coords)){
      stop ("Position: coords is NULL")
    }
    return(TRUE)
  }
)


#*******************************************************
#CONSTRUCTOR
#*******************************************************

setMethod(
  f="initialize",
  signature="Position",
  definition=function(.Object, coords){
    cat ("~~~~~ Position: initializator ~~~~~ \n")
    natts <- 1
    flag <- vector(mode = "logical", length = natts)
    if(missing(coords)) coords <- list() else flag[1] <- TRUE
    .Object@coords <- coords
    if(sum(flag) != 0) validObject(.Object)
    return(.Object)
  }
)

position <- function(coords){
  cat ("~~~~~ Position: User fiendly constructor ~~~~~ \n")
  new (Class = "Position", coords = coords)
}

#*******************************************************
#ACCESSORS
#*******************************************************


#' Returns the object's coords
#'
#' @param object A Position object
#' @docType methods
#' @export
setGeneric("getCoords",function(object){standardGeneric ("getCoords")})
setMethod("getCoords","Position",
          function(object){
            return(object@coords)
          }
)


#' Sets the object's coords
#'
#' @param object A Position object
#' @param coords A list
#' @docType methods
#' @export
setGeneric("setCoords",function(object, coords){standardGeneric ("setCoords")})
setMethod("setCoords","Position",
          function(object, coords){
            object@coords <- coords
          }
)



#*******************************************************
#GENERIC METHODS
#*******************************************************

#' Returns the length of the object
#'
#' @param x An object
#' @return A numeric value
#' @docType methods
#' @export
setMethod ("length","Position",
           function(x){
             cat("*** Class Position, method length *** \n")
             length(x@coords)
           }
)


#*******************************************************
#METHODS
#*******************************************************