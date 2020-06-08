#' @export
#'
#' @exportPattern ^[^\.]
#' @importFrom magrittr "%>%"
#' @export %>%
client <- function(apiKey = NULL) {
  structure(list(pyClient = cmdcPY$Client(apiKey)),
            class = c("cmdcClient"))
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
