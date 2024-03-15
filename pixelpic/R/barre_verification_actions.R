#' Masquer la barre de vérification
#'
#' @export
masquer_barre_verification <- function() {
  shinyjs::runjs("shinyjs.hide('barre_verification');")
}

#' Montrer la barre de vérification lorsque la grille est prête
#'
#' @param picross La matrice représentant le puzzle Picross
#' @export
montrer_barre_verification <- function(picross) {
  if (!is.null(picross)) {
    shinyjs::runjs("shinyjs.show('barre_verification');")
  }
}
