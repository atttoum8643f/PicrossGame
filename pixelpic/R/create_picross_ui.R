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
    theme = shinytheme("superhero"),
    taille_grille = 5,
    min_taille_grille = 5,
    max_taille_grille = 15,
    step_taille_grille = 1
) {
  ui <- fluidPage(
    theme = theme,
    titlePanel("Jeu Picross"),

    # Utiliser shinyjs pour masquer les boutons lorsque la grille n'est pas sélectionnée
    shinyjs::useShinyjs(),
    shinyjs::extendShinyjs(text = "shinyjs.hide('barre_verification');", functions = c("hide_barre")),
    sidebarLayout(
      sidebarPanel(
        sliderInput(
          inputId = "nb_lignes",
          label = "Nombre de lignes",
          value = 5,
          min = 5,
          max = 15,
          step = 1
        ),
        sliderInput(
          inputId = "nb_colonnes",
          label = "Nombre de colonnes",
          value = 5,
          min = 5,
          max = 15,
          step = 1
        ),
        actionButton(inputId = "btn_recharger", label = "Recharger la grille", style = "width: 100%; margin-top: 10px;")
      ),

      mainPanel(
        tabsetPanel(
          tabPanel(
            title = "Jeu Picross",
            uiOutput("grille_picross"),  # Affichage de la grille Picross à la place du nuage de points
            uiOutput("barre_verification")  # Affichage de la barre de vérification
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
