#' Afficher la solution du Picross
#'
#' Cette fonction modifie la grille existante pour afficher la solution de la grille Picross en colorant les cellules
#' remplies en vert foncé.
#'
#' @param solution_matrix Une matrice représentant la solution de la grille Picross avec des valeurs binaires (0 pour une cellule vide, 1 pour une cellule remplie).
#' @param nb_lignes Le nombre de lignes de la grille Picross.
#' @param nb_colonnes Le nombre de colonnes de la grille Picross.
#'
#' @return Une interface utilisateur Shiny pour afficher la solution du Picross.
#'
#' @examples
#' # Afficher la solution de la grille Picross sur la grille existante
#' afficher_solution(solution, nb_lignes, nb_colonnes)
#'
#' @export
#'
afficher_solution <- function(solution_matrix, nb_lignes, nb_colonnes) {
  divs_grille <- list(
    tags$div(style = "font-weight: bold; text-align: center;", "Solution du Picross"),
    tags$div(
      id = "grilleSolution",
      style = paste0(
        "display: grid; grid-template-columns: repeat(", nb_colonnes, ", 30px);",
        "grid-gap: 5px;"  # Ajout d'un espacement entre les cellules
      )
    )
  )

  for (ligne in 1:nb_lignes) {
    for (colonne in 1:nb_colonnes) {
      valeur <- solution_matrix[ligne, colonne]
      couleur <- ifelse(valeur == 1, "darkgreen", "white")

      divs_grille[[2]] <- tagAppendChild(
        divs_grille[[2]],
        tags$div(
          style = paste0(
            "background-color: ", couleur, ";",
            "border: 1px solid #000;",
            "padding: 5px;",
            "text-align: center;",
            "width: 30px;",
            "height: 30px;"
          )
        )
      )
    }
  }

  do.call(tagList, divs_grille)
}
