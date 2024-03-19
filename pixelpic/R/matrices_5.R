#' Générer des matrices pour le jeu Picross (Taille 5x5)
#'
#' Cette fonction crée des matrices pour le jeu Picross avec différentes formes en 5x5.
#'
#' @return Une liste de matrices pour le jeu Picross avec des formes telles qu'une maison, un avion, le chiffre "8", une forme de pique et un cœur.
#'
#' @examples
#' matrices_jeu_5 <- matrices_5()
#'
#' @export
matrices_5 <- function() {
  matrice_maison <- matrix(c(
    0, 0, 1, 0, 0,
    0, 1, 0, 1, 0,
    1, 1, 1, 1, 1,
    1, 0, 1, 0, 1,
    1, 0, 1, 0, 1
  ), nrow = 5, byrow = TRUE)

  matrice_avion <- matrix(c(
    0, 0, 1, 0, 0,
    0, 0, 1, 0, 0,
    0, 1, 1, 1, 0,
    0, 0, 1, 0, 0,
    1, 1, 1, 1, 1
  ), nrow = 5, byrow = TRUE)

  matrice_181 <- matrix(c(
    1, 0, 1, 0, 1,
    1, 1, 0, 1, 1,
    1, 0, 1, 0, 1,
    1, 1, 0, 1, 1,
    1, 0, 1, 0, 1
  ), nrow = 5, byrow = TRUE)

  matrice_pique <- matrix(c(
    0, 0, 1, 0, 0,
    0, 1, 0, 1, 0,
    1, 0, 0, 0, 1,
    0, 1, 1, 1, 0,
    0, 0, 1, 0, 0
  ), nrow = 5, byrow = TRUE)

  matrice_coeur <- matrix(c(
    0, 1, 0, 1, 0,
    1, 1, 1, 1, 1,
    1, 1, 1, 1, 1,
    0, 1, 1, 1, 0,
    0, 0, 1, 0, 0
  ), nrow = 5, byrow = TRUE)

  liste_matrices <- list(
    maison = matrice_maison,
    avion = matrice_avion,
    chiffre_8 = matrice_181,
    pique = matrice_pique,
    coeur = matrice_coeur
  )

  return(liste_matrices)
}
