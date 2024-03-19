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
  taille <- nrow(picross)

  # Ajout d'étiquettes pour les indices numériques des lignes
  divs_grille <- list(
    tags$div(style = "font-weight: bold; text-align: center;", "Grille Picross"),
    tags$div(
      id = "grillePicross",
      style = paste0(
        "display: grid; grid-template-columns: repeat(", taille + 1, ", 30px);",
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
  for (colonne in 1:taille) {
    divs_grille[[2]] <- tagAppendChild(
      divs_grille[[2]],
      tags$div(style = "text-align: center; white-space: nowrap;",
               ifelse(length(which(diff(picross[,colonne]) == 1)) == 0, "", paste0(length(which(diff(picross[,colonne]) == 1)), collapse = "\u00A0"))
      )
    )
  }

  for (ligne in 1:taille) {
    # Ajouter l'indice numérique pour la ligne
    divs_grille[[2]] <- tagAppendChild(
      divs_grille[[2]],
      tags$div(style = "text-align: center; white-space: nowrap;",
               ifelse(length(which(diff(picross[ligne,]) == 1)) == 0, "", paste0(length(which(diff(picross[ligne,]) == 1)), collapse = "\u00A0"))
      )
    )

    for (colonne in 1:taille) {
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
