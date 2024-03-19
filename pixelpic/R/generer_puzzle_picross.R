#' Générer un puzzle Picross aléatoire
#'
#' Cette fonction crée un puzzle Picross aléatoire en cachant des images derrière une grille de taille spécifiée.
#'
#' @param taille_grille La taille de la grille Picross. Doit être un entier positif.
#' @return Une matrice binaire représentant le puzzle Picross généré.
#'
#' @source "matrices_5.R"
#' @source "matrices_10.R"
#'
#' @examples
#' # Générer un puzzle Picross de taille 5x5
#' puzzle <- generer_puzzle_picross(5)
#'
#' # Générer un puzzle Picross de taille 10x10
#' puzzle <- generer_puzzle_picross(10)
#'
#' # Générer un puzzle Picross de taille 15x15
#' puzzle <- generer_puzzle_picross(15)
#'
#' @export
generer_puzzle_picross <- function(taille_grille) {
  # Vérifier la taille de la grille et choisir la liste de matrices appropriée
  if (taille_grille == 5) {
    i = sample(c(1,2,3,4,5),1)
    mat <- matrices_5()
    matrice = mat[[i]]
  } else if (taille_grille == 10) {
    i = sample(c(1,2,3),1)
    mat <- matrices_10()
    matrice = mat[[i]]
  } else if (taille_grille == 15) {
    matrice <- matrix(sample(c(0, 1), 15*15, replace = TRUE),
                      nrow = 15, ncol = 15)
  } else {
    stop("Taille de grille non prise en charge.")
  }

  return(matrice)
}
