#' The ESTIMATOR class
#'
#' Use this class for representing a Field object's estimator.
#'
#'
#'@section Slots :
#' \describe{
#' \item{\code{knownPosition}:}{Object of class \code{"Position"}, hold the positions of the Field object to be accounted during estimation.}
#' \item{\code{valueSubset}:}{Object of class \code{"Value"}, hold the value of the known positions.}
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
    valueSubset = "Value",
    unknownPosition = "Position"
  ),
  validity = function(object){
    cat("~~~ ValueReduct: inspector ~~~ \n")
    P <- object@knownPosition
    V <- object@valueSubset
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

setMethod(
  f="initialize",
  signature="Estimator",
  definition=function(.Object, knownPosition, valueSubset, unknownPosition){
    cat ("~~~~~ Estimator: initializator ~~~~~ \n")
    natts <- 3
    flag <- vector(mode = "logical", length = natts)
    if(missing(knownPosition)) knownPosition <- new("Position") else flag[1] <- TRUE
    if(missing(valueSubset)) valueSubset <- new("Value") else flag[2] <- TRUE
    if(missing(unknownPosition)) unknownPosition <- new("Position") else flag[3] <- TRUE
    .Object@knownPosition <- knownPosition
    .Object@valueSubset <- valueSubset
    .Object@unknownPosition <- unknownPosition
    if(sum(flag) != 0) validObject(.Object)
    return(.Object)
  }
)


#*******************************************************
#ACCESSORS
#*******************************************************

#' Returns the object's known positions
#'
#' @param object A Field object
#' @docType methods
#' @export
setGeneric("getKnownPosition",function(object){standardGeneric ("getKnownPosition")})
setMethod("getKnownPosition","Estimator",
          function(object){
            return(object@knownPosition)
          }
)

#' Returns the object's values
#'
#' @param object A Field object
#' @docType methods
#' @export
setGeneric("getValueSubset",function(object){standardGeneric ("getValueSubset")})
setMethod("getValueSubset","Estimator",
          function(object){
            return(object@valueSubset)
          }
)

#' Returns the object's unknown positions
#'
#' @param object A Field object
#' @docType methods
#' @export
setGeneric("getUnknownPosition",function(object){standardGeneric ("getUnknownPosition")})
setMethod("getUnknownPosition","Estimator",
          function(object){
            return(object@unknownPosition)
          }
)

#setKnownPosition
#setValueSubset
#setUnknownPosition



#*******************************************************
#GENERIC METHODS
#*******************************************************

#' Returns the length of the object
#'
#' @param x An object
#' @return A numeric value
#' @docType methods
#' @export
setMethod ("length","Estimator",
            function(x){
              cat("*** Class Estimator, method length *** \n")
              length(x@knownPosition) + length(x@valueSubset) + length(x@unknownPosition)
            }
)

#*******************************************************
#METHODS
#*******************************************************