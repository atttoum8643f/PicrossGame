#' Générer des matrices pour le jeu Picross (Taille 10x10)
#'
#' Cette fonction crée des matrices pour le jeu Picross avec différentes formes en 10x10.
#'
#' @return Une liste de matrices pour le jeu Picross avec des formes telles que l'histogramme, un sablier, et le symbole infini.
#'
#' @examples
#' matrices_jeu_10 <- matrices_10()
#'
#' @export
matrices_10 <- function(){

  # Matrice représentant un histogramme pour le jeu Picross (10x10)
  matrice_histogramme <- matrix(c(
    1, 1, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 1, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 1, 1, 1, 0, 0, 0, 0, 0, 0,
    1, 1, 1, 1, 0, 0, 0, 0, 0, 0,
    1, 1, 1, 1, 0, 0, 0, 0, 0, 0,
    1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
    1, 1, 1, 1, 1, 1, 1, 1, 0, 0,
    1, 1, 1, 1, 1, 1, 1, 1, 0, 0,
    1, 1, 1, 1, 1, 1, 1, 1, 0, 0,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  ), nrow = 10, byrow = TRUE)

  # Matrice représentant un sablier pour le jeu Picross (10x10)
  matrice_sablier <- matrix(c(
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 0, 1, 1, 1, 1, 0, 1, 1,
    1, 0, 0, 0, 1, 1, 0, 0, 0, 1,
    1, 0, 0, 0, 1, 1, 0, 0, 0, 1,
    1, 0, 0, 0, 1, 1, 0, 0, 0, 1,
    1, 0, 0, 0, 1, 1, 0, 0, 0, 1,
    1, 1, 0, 1, 1, 1, 1, 0, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  ), nrow = 10, byrow = TRUE)


  # Matrice représentant le symbole infini pour le jeu Picross (10x10)
  matrice_infini <- matrix(c(
    0, 1, 1, 0, 0, 0, 0, 1, 1, 0,
    1, 1, 1, 1, 0, 0, 1, 1, 1, 1,
    1, 1, 0, 1, 1, 1, 1, 0, 1, 1,
    1, 0, 0, 0, 1, 1, 0, 0, 0, 1,
    1, 0, 0, 0, 1, 1, 0, 0, 0, 1,
    1, 0, 0, 0, 1, 1, 0, 0, 0, 1,
    1, 0, 0, 0, 1, 1, 0, 0, 0, 1,
    1, 1, 0, 1, 1, 1, 1, 0, 1, 1,
    1, 1, 1, 1, 0, 0, 1, 1, 1, 1,
    0, 1, 1, 0, 0, 0, 0, 1, 1, 0
  ), nrow = 10, byrow = TRUE)

  return(list(
    histogramme = matrice_histogramme,
    sablier = matrice_sablier,
    infini = matrice_infini
  ))
}


