#' The VALUE class
#'
#' Use this class for representing a Field object's values.
#'
#'
#'@section Slots :
#' \describe{
#' \item{\code{valueSet}:}{Object of class \code{"list"}, values of a Field object.}
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
    valueSet = "list"
  ),
  validity = function(object){
    cat("~~~ ValueReduct: inspector ~~~ \n")
    V <- object@valueSet
    if(is.null(V)){
      stop ("[Value: valueSet is NULL")
    }else{}
    return(TRUE)
  }
)


#*******************************************************
#CONSTRUCTOR
#*******************************************************

setMethod(
  f="initialize",
  signature="Value",
  definition=function(.Object, valueSet){
    cat ("~~~~~ Value: initializator ~~~~~ \n")
    natts <- 1
    flag <- vector(mode = "logical", length = natts)
    if(missing(valueSet)) valueSet <- list() else flag[1] <- TRUE
    .Object@valueSet <- valueSet
    if(sum(flag) != 0) validObject(.Object)
    return(.Object)
  }
)


value <- function(valueSet){
  cat ("~~~~~ Value: User fiendly constructor ~~~~~ \n")
  new (Class = "Value", valueSet = valueSet)
}

#*******************************************************
#ACCESSORS
#*******************************************************

#' Returns the object's value(s)
#'
#' @param object A Field object
#' @docType methods
#' @export
setGeneric("getValueSet",function(object){standardGeneric ("getValueSet")})
setMethod("getValueSet","Value",
          function(object){
            return(object@valueSet)
          }
)



#' Returns the object's value(s)
#'
#' @param object A Field object
#' @param valueSet A list
#' @docType methods
#' @export
setGeneric("setValueSet",function(object, valueSet){standardGeneric ("setValueSet")})
setMethod("setValueSet","Value",
          function(object, valueSet){
            object@valueSet <- valueSet
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
setMethod ("length","Value",
           function(x){
             cat("*** Class Value, method length *** \n")
             length(x@valueSet)
           }
)

#*******************************************************
#METHODS
#*******************************************************