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
    cat("~~~ ValueReduct: inspector ~~~ \n")
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

setMethod(
  f="initialize",
  signature="Extent",
  definition=function(.Object, minPosition, maxPosition){
    cat ("~~~~~ Extent: initializator ~~~~~ \n")
    natts <- 2
    flag <- vector(mode = "logical", length = natts)
    if(missing(minPosition)) minPosition <- new("Position") else flag[1] <- TRUE
    if(missing(maxPosition)) maxPosition <- new("Position") else flag[2] <- TRUE
    .Object@minPosition <- minPosition
    .Object@maxPosition <- maxPosition
    if(sum(flag) != 0) validObject(.Object)
    return(.Object)
  }
)



#*******************************************************
#ACCESSORS
#*******************************************************

#' Returns the object's minimal position
#'
#' @param object A Field object
#' @docType methods
#' @export
setGeneric("getMinPosition",function(object){standardGeneric ("getMinPosition")})
setMethod("getMinPosition","Extent",
          function(object){
            return(object@minPosition)
          }
)

#' Returns the object's maximum position
#'
#' @param object A Field object
#' @docType methods
#' @export
setGeneric("getMaxPosition",function(object){standardGeneric ("getMaxPosition")})
setMethod("getMaxPosition","Extent",
          function(object){
            return(object@minPosition)
          }
)

#' Sets the object's minimum position
#'
#' @param object A Field object
#' @param position A Position object
#' @docType methods
#' @export
setGeneric("setMinPosition",function(object, position){standardGeneric ("setMinPosition")})
setMethod("setMinPosition","Extent",
          function(object, position){
            object@minPosition <- position
          }
)

#' Returns the object's maximum position
#'
#' @param object A Field object
#' @param position A Position object
#' @docType methods
#' @export
setGeneric("setMaxPosition",function(object, position){standardGeneric ("setMaxPosition")})
setMethod("setMaxPosition","Extent",
          function(object, position){
            object@minPosition <- position
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
setMethod ("length","Extent",
            function(x){
              cat("*** Class Extent, method length *** \n")
              length(x@minPosition) + length(x@maxPosition)
            }
)

#*******************************************************
#METHODS
#*******************************************************