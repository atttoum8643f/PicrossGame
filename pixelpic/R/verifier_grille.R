#' Vérifier la grille
#'
#' @param picross La matrice représentant le puzzle Picross
#' @param input L'objet input de Shiny
#' @export
verifier_grille <- function(picross, input) {
  grille_joueur <- matrix(0, nrow = input$taille_grille, ncol = input$taille_grille)

  for (ligne in 1:input$taille_grille) {
    for (colonne in 1:input$taille_grille) {
      id_bouton <- paste0("btn_", ligne, "_", colonne)
      valeur_bouton <- input[[id_bouton]]

      # Marquer la case du joueur comme remplie si le bouton a été cliqué, sinon elle reste vide
      grille_joueur[ligne, colonne] <- if (valeur_bouton > 0) 1 else 0
    }
  }

  # Vérifier si la grille du joueur correspond à la solution attendue
  if (identical(grille_joueur, picross)) {
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
}
