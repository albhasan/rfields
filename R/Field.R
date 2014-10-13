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
    cat("~~~ ValueReduct: inspector ~~~ \n")
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

setMethod(
  f="initialize",
  signature="Field",
  definition=function(.Object, extent, position, value, estimator){
    cat ("~~~~~ Field: initializator ~~~~~ \n")
    natts <- 4
    flag <- vector(mode = "logical", length = natts)
    if(missing(extent)) extent <- new("Extent") else flag[1] <- TRUE
    if(missing(position)) position <- new("Position") else flag[1] <- TRUE
    if(missing(value)) value <- new("Value") else flag[1] <- TRUE
    if(missing(estimator)) estimator <- new("Estimator") else flag[1] <- TRUE
    .Object@extent <- extent
    .Object@position <- position
    .Object@value <- value
    .Object@estimator <- estimator
    if(sum(flag) != 0) validObject(.Object)
    return(.Object)
  }
)



#*******************************************************
#ACCESSORS
#*******************************************************

#' Returns the object's extent
#'
#' @param object A Field object
#' @docType methods
#' @export
setGeneric("getExtent",function(object){standardGeneric ("getExtent")})
setMethod("getExtent","Field",
          function(object){
            return(object@extent)
          }
)

#' Returns the object's position(s)
#'
#' @param object A Field object
#' @docType methods
#' @export
setGeneric("getPosition",function(object){standardGeneric ("getPosition")})
setMethod("getPosition","Field",
          function(object){
            return(object@position)
          }
)

#' Returns the object's value(s)
#'
#' @param object A Field object
#' @docType methods
#' @export
setGeneric("getValue",function(object){standardGeneric ("getValue")})
setMethod("getValue","Field",
          function(object){
            return(object@value)
          }
)

#' Returns the object's estimator
#'
#' @param object A Field object
#' @docType methods
#' @export
setGeneric("getEstimator",function(object){standardGeneric ("getEstimator")})
setMethod("getEstimator","Field",
          function(object){
            return(object@estimator)
          }
)

#' Sets the object's extent
#'
#' @param object A Field object
#' @param extent A Extent object
#' @docType methods
#' @export
setGeneric("setExtent",function(object, extent){standardGeneric ("setExtent")})
setMethod("setExtent","Field",
          function(object, extent){
            object@extent <- extent
          }
)

#' Sets the object's position values
#'
#' @param object A Field object
#' @param position A Position object
#' @docType methods
#' @export
setGeneric("setPosition",function(object, position){standardGeneric ("setPosition")})
setMethod("setPosition","Field",
          function(object, position){
            object@position <- position
          }
)

#' Sets the object's values
#'
#' @param object A Field object
#' @param value A Value object
#' @docType methods
#' @export
setGeneric("setValue",function(object, value){standardGeneric ("setValue")})
setMethod("setValue","Field",
          function(object, value){
            object@value <- value
          }
)


#' Sets the object's values
#'
#' @param object A Field object
#' @param estimator A Estimator object
#' @docType methods
#' @export
setGeneric("setEstimator",function(object, estimator){standardGeneric ("setEstimator")})
setMethod("setEstimator","Field",
          function(object, estimator){
            object@estimator <- estimator
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
setMethod ("length","Field",
           function(x){
              cat("*** Class Field, method length *** \n")
              length(x@extent) + length(x@position) + length(x@value) + length(x@estimator)
           }
)



#*******************************************************
#METHODS
#*******************************************************

#' Loads the input files to SciDB and it deletes the source files. It doesn't load in parallel
#'
#' @param object A Field object
#' @param position A Position object
#' @param value A Value object
#' @return A new Field object
#' @docType methods
#' @export
setGeneric(name = "addObservation", def = function(object, position, value){standardGeneric("addObservation")})
setMethod(
  f = "addObservation",
  signature = "Field",
  definition = function(object, position, value){

    
    #.Object, extent, position, value, estimator
    
  }
)
