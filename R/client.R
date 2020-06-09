#' Construct a client to talk to the CMDC api
#'
#' @param apikey A string containing the APIKEY.
#' @return An S3 object with class cmdcClient that implements routines for accessing CMDC API endpoints
#'
#' @export
#'
#' @exportPattern ^[^\.]
#' @importFrom magrittr "%>%"
#' @export %>%
client <- function(apikey = NULL) {
  pyClient = cmdcPY$Client(apikey)
  fields <- list(pyClient=pyClient)
  structure(fields, class = c("cmdcClient"))
}


#' Print information about the client and current request
#'
#' @export
print.cmdcClient <- function (x)
  print(x$pyClient)


#' List all dataets accessible by the client
#'
#' @export
datasets.cmdcClient <-
  function (x)
    reticulate::py_list_attributes(x$pyClient)

#' Fetch the currently constructed dataset
#'
#' @return A data.frame (tibble) containing requested data
#'
#' @export
fetch.cmdcClient <- function (x) {
  tibble::as_tibble(x$pyClient$fetch())
}

#' Fetch the currently constructed dataset
#'
#' @return A string containing the API Key
#'
#' @export
register.cmdcClient <- function (x, ...) {
  x$pyClient$register(...)
}



#' Reset the current request on this client
#'
#' @return The client
#'
#' @export
reset.cmdcClient <- function (x) {
  x$pyClient$reset()
  x
}

#' Get information about the API as a whole (`info(client)`) or a specific
#' endpoint (`info(client, endpoint)`, for exapmle `info(client, "demographics")`)
#' @export
info.cmdcClient <- function(c, x=NULL) {
  if (is.null(x)) {
    print(c)
    print("Datasets are:")
    cat(c("", datasets(c)), sep="\n- ")
    return
  } else {
    cat(c[[paste0(x, "_help")]])
  }
}
