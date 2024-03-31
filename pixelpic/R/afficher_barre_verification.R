#' Afficher la barre de vérification
#'
#' Cette fonction génère une interface utilisateur Shiny pour afficher la barre de vérification
#' avec des boutons interactifs pour sélectionner différents modes d'interaction avec la grille Picross.
#'
#' @return Une interface utilisateur Shiny pour la barre de vérification.
#'
#' @examples
#' # Afficher la barre de vérification
#' afficher_barre_verification()
#'
#' @export
afficher_barre_verification <- function() {
  divs_barre <- list(
    tags$div(
      style = "display: flex; margin-top: 20px;",
      actionButton(
        inputId = "btn_noir",
        label = "Noir",
        style = "width: 70px; background-color: black; color: white; margin-right: 5px;"
      ),
      actionButton(
        inputId = "btn_croix_rouge",
        label = icon("times", class = "fa-2x"),
        style = "width: 70px; background-color: white; color: red; border: 1px solid red; margin-right: 5px;"
      ),
      actionButton(
        inputId = "btn_verification",
        label = "Vérification",
        style = "width: 100px; background-color: green; color: white;margin-right: 5px;"
      ),
      actionButton(
        inputId = "btn_solution",
        label = "Solution",
        style = "width: 100px; background-color: orange; color: white;"
      )
    )
  )

  do.call(tagList, divs_barre)
}
