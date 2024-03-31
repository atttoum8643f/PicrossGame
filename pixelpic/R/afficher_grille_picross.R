#' Afficher la grille Picross avec des boutons et une barre de vérification
#'
#' Cette fonction génère une représentation visuelle d'une grille de jeu Picross avec des boutons
#' interactifs pour remplir ou bloquer les cellules, ainsi qu'une barre de vérification pour vérifier
#' la solution.
#'
#' @param picross Une matrice représentant la grille Picross avec des valeurs binaires (0 pour une cellule vide, 1 pour une cellule remplie).
#'
#' @return Une structure HTML représentant la grille Picross avec des boutons interactifs.
#'
#' @examples
#' # Générer une grille Picross aléatoire
#' picross <- generer_puzzle_picross(10)
#'
#' # Afficher la grille Picross
#' afficher_grille_picross(picross)
#'
#' @export
#'
afficher_grille_picross <- function(picross) {
  nb_lignes <- nrow(picross)
  nb_colonnes <- ncol(picross)

  # Récupérer les indices des lignes et des colonnes
  indices_lignes <- sapply(1:nb_lignes, function(i) calculer_indices(picross[i, ]))
  indices_colonnes <- sapply(1:nb_colonnes, function(j) calculer_indices(picross[, j]))

  # Ajout d'étiquettes pour les indices numériques des lignes
  divs_grille <- list(
    tags$div(style = "font-weight: bold; text-align: center;", "Grille Picross"),
    tags$div(
      id = "grillePicross",
      style = paste0(
        "display: grid; grid-template-columns: repeat(", nb_colonnes + 1, ", 30px);",
        "grid-gap: 5px;"  # Ajout d'un espacement entre les cellules
      )
    )
  )

  # Ajouter une ligne vide pour les indices numériques en haut
  divs_grille[[2]] <- tagAppendChild(
    divs_grille[[2]],
    tags$div(style = "width: 30px;")
  )

  # Ajouter les indices numériques pour les colonnes
  for (colonne in 1:nb_colonnes) {
    indices <- indices_colonnes[[colonne]]
    indices_texte <- ifelse(length(indices) == 0, "", paste(indices, collapse = "\n"))

    divs_grille[[2]] <- tagAppendChild(
      divs_grille[[2]],
      tags$div(
        style = "text-align: center; white-space: pre-line;",
        indices_texte
      )
    )
  }

  for (ligne in 1:nb_lignes) {
    # Ajouter l'indice numérique pour la ligne
    indices <- indices_lignes[[ligne]]
    indices_texte <- ifelse(length(indices) == 0, "", paste(indices, collapse = " "))

    divs_grille[[2]] <- tagAppendChild(
      divs_grille[[2]],
      tags$div(
        style = "text-align: center; white-space: nowrap;",
        indices_texte
      )
    )

    for (colonne in 1:nb_colonnes) {
      valeur <- picross[ligne, colonne]

      class_name <- ifelse(valeur == 0, "celluleVide", "celluleRemplie")

      divs_grille[[2]] <- tagAppendChild(
        divs_grille[[2]],
        actionButton(
          inputId = paste0("btn_", ligne, "_", colonne),
          label = "",
          class = paste("cellulePicross", class_name),
          style = "border: 1px solid #000; padding: 5px; text-align: center; width: 30px; height: 30px;"  # Ajustement de la taille des cellules
        )
      )
    }
  }

  # Concaténation des deux parties
  do.call(tagList, divs_grille)
}
