#' Logique du serveur Shiny pour l'application Picross
#'
#' Ce script définit la logique du serveur Shiny pour l'application Picross. Il charge
#' différentes fonctions nécessaires à partir de scripts externes et met en œuvre le
#' comportement de l'application, y compris la génération de la grille, l'affichage,
#' la vérification et la gestion des modes.
#'
#' @import shiny
#' @import shinythemes
#' @import shinyjs
#' @importFrom shiny fluidPage titlePanel sidebarLayout sidebarPanel sliderInput mainPanel tabsetPanel tabPanel
#' @importFrom shinythemes shinytheme
#' @importFrom shinyjs useShinyjs extendShinyjs
#'
#' @source "generer_puzzle.R"
#' @source "afficher_grille.R"
#' @source "barre_verification.R"
#' @source "afficher_reglement.R"
#' @source "barre_verification_actions.R"
#' @source "modes.R"
#' @source "verifier_grille.R"
#'
#' @export
server <- function(input, output) {
  # Observer pour afficher la taille de la grille
  observe({
    print(input$taille_grille)
  })

  # Générer un puzzle Picross aléatoire
  picross <- reactive({
    generer_puzzle_picross(input$taille_grille)
  })

  # Afficher la grille Picross avec des boutons
  output$grille_picross <- renderUI({
    afficher_grille_picross(picross())
  })

  # Afficher les détails du jeu
  output$reglement_text <- renderText({
    afficher_reglement_text()
  })

  # Afficher la barre de vérification
  output$barre_verification <- renderUI({
    afficher_barre_verification()
  })

  # Masquer la barre de vérification au début
  observe({
    masquer_barre_verification()
  })

  # Montrer la barre de vérification lorsque la grille est prête
  observe({
    montrer_barre_verification(picross())
  })

  # Activer les modes
  # Activer le mode "Noir"
  observeEvent(input$btn_noir, {
    shinyjs::runjs("
      var modeNoir = true;
      $('.cellulePicross').click(function() {
        if (modeNoir) {
          $(this).css('background-color', 'black');
          // Réinitialiser l'icône de croix rouge si elle existe
          $(this).html('');
        }
      });
    ")
  })

  # Activer le mode "Croix Rouge"
  observeEvent(input$btn_croix_rouge, {
    shinyjs::runjs("
      var modeCroixRouge = true;
      $('.cellulePicross').click(function() {
        if (modeCroixRouge) {
          $(this).css('background-color', 'white');  // Couleur de fond blanc pour simuler une croix rouge
          $(this).html('<i class=\"fas fa-times\" style=\"color: red;\"></i>');  // Ajouter une icône de croix rouge
        }
      });
    ")
  })

  # Réaction à l'événement de clic sur les boutons
  observeEvent(input$clicked_button, {
    # input$clicked_button contient le nom du bouton cliqué, vous pouvez utiliser cette information dans votre logique
    print(input$clicked_button)
    # Ajoutez le code nécessaire en fonction du bouton cliqué
  })

  # Activer le mode "Vérification"
  observeEvent(input$btn_verification, {
    verifier_grille(picross(), input)
  })
}
