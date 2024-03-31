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
#' @source "verifier_grille.R"
#' @source "afficher_solution.R"
#' @source "activer_modes.R"
#' @source "matrices_10.R"
#' @source "matrices_5.R"
#' @source "calculer_indices.R"
#'
#' @export
server <- function(input, output, session) {
  # Générer un puzzle Picross aléatoire
  picross <- reactive({
    generer_puzzle_picross(input$nb_lignes, input$nb_colonnes)
  })

  # Solution du puzzle Picross
  solution <- reactiveVal(NULL)

  # Stocker la grille générée pour afficher la solution
  observeEvent(input$btn_solution, {
    solution(picross())
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
    shinyjs::hide('barre_verification')
  })

  # Montrer la barre de vérification lorsque la grille est prête
  observeEvent(picross(), {
    shinyjs::show('barre_verification')
  })

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


  # Activer le mode "Vérification"
  observeEvent(input$btn_verification, {
    grille_joueur <- matrix(0, nrow = input$nb_lignes, ncol = input$nb_colonnes)
    grille_solution <- picross()  # Récupérer la solution

    for (ligne in 1:input$nb_lignes) {
      for (colonne in 1:input$nb_colonnes) {
        id_bouton <- paste0("btn_", ligne, "_", colonne)
        valeur_bouton <- input[[id_bouton]]

        # Marquer la case du joueur comme remplie si le bouton a été cliqué et que c'est une case noire
        if (valeur_bouton > 0 && grille_solution[ligne, colonne] == 1) {
          grille_joueur[ligne, colonne] <- 1
        }
      }
    }

    # Vérifier si la grille du joueur correspond à la solution attendue
    if (identical(grille_joueur, grille_solution)) {
      showModal(modalDialog(
        title = "Bravo!",
        "Félicitations, vous avez réussi l'énigme!"
      ))
    } else {
      showModal(modalDialog(
        title = "Dommage!",
        "La grille ne correspond pas à la solution. Veuillez réessayer."
      ))
    }
  })

  # Afficher la solution
  observeEvent(input$btn_solution, {
    if (!is.null(solution())) {
      for (ligne in 1:input$nb_lignes) {
        for (colonne in 1:input$nb_colonnes) {
          id_bouton <- paste0("btn_", ligne, "_", colonne)
          if (solution()[ligne, colonne] == 1) {
            shinyjs::runjs(sprintf("document.getElementById('%s').style.backgroundColor = 'darkgreen';", id_bouton))
          }
        }
      }
    }
  })

  # Recharger la grille
  observeEvent(input$btn_recharger, {
    shinyjs::hide('barre_verification')
    solution(NULL)
  })
}
