#' Interface utilisateur Shiny pour le Jeu Picross
#'
#' Cette interface utilisateur Shiny définit la mise en page et les composants graphiques
#' pour le jeu Picross, y compris la grille, la barre de vérification et les détails du jeu.
#'
#' @import shiny
#' @import shinythemes
#' @import shinyjs
#' @importFrom shiny fluidPage titlePanel sidebarLayout sidebarPanel sliderInput mainPanel tabsetPanel tabPanel
#' @importFrom shinythemes shinytheme
#' @importFrom shinyjs useShinyjs extendShinyjs
#'
#' @param theme Thème visuel à utiliser pour l'application.
#' @param taille_grille Taille initiale de la grille Picross.
#' @param min_taille_grille Taille minimale autorisée pour la grille Picross.
#' @param max_taille_grille Taille maximale autorisée pour la grille Picross.
#' @param step_taille_grille Incrément pour la sélection de la taille de la grille Picross.
#'
#' @return Une interface utilisateur Shiny pour le jeu Picross.
#'
#' @examples
#' # Créer l'interface utilisateur
#' ui <- create_picross_ui(theme = "superhero", taille_grille = 5, min_taille_grille = 5, max_taille_grille = 15, step_taille_grille = 5)
#'
#' @export
#' @name create_picross_ui
#' @title Interface utilisateur Shiny pour le Jeu Picross
create_picross_ui <- function(
    theme = shinythemes::shinytheme("superhero"),
    taille_grille = 5,
    min_taille_grille = 5,
    max_taille_grille = 15,
    step_taille_grille = 5
) {
  ui <- fluidPage(
    theme = theme,
    titlePanel("Jeu Picross"),
    sidebarLayout(
      sidebarPanel(
        sliderInput(
          inputId = "taille_grille",
          label = "Sélectionnez la taille de la grille Picross",
          value = taille_grille,
          min = min_taille_grille,
          max = max_taille_grille,
          step = step_taille_grille
        )
      ),
      mainPanel(
        tabsetPanel(
          tabPanel(
            title = "Jeu Picross",
            uiOutput("grille_picross"),  # Affichage de la grille Picross
            uiOutput("barre_verification"),  # Affichage de la barre de vérification
            uiOutput("solution_picross")  # Affichage de la solution Picross
          ),
          tabPanel(
            title = "Règlement du Jeu",
            textOutput("reglement_text")  # Affichage des détails du jeu
          )
        )
      )
    )
  )
  return(ui)
}
