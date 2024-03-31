#' Générer un puzzle Picross aléatoire
#'
#' Cette fonction crée un puzzle Picross aléatoire en spécifiant le nombre de lignes et de colonnes de la grille.
#'
#' @param nb_lignes Le nombre de lignes de la grille Picross.
#' @param nb_colonnes Le nombre de colonnes de la grille Picross.
#'
#' @return Une matrice binaire représentant le puzzle Picross généré.
#'
#' @examples
#' # Générer un puzzle Picross de taille 5x5
#' puzzle <- generer_puzzle_picross(5, 5)
#'
#' # Générer un puzzle Picross de taille 10x10
#' puzzle <- generer_puzzle_picross(10, 10)
#'
#' @export
#'
generer_puzzle_picross <- function(nb_lignes, nb_colonnes) {
  if (nb_lignes == nb_colonnes) {
    if (nb_lignes == 5) {
      mat <- matrices_5()
      return(mat[[sample(1:5, 1)]])
    } else if (nb_lignes == 10) {
      mat <- matrices_10()
      return(mat[[sample(1:3, 1)]])
    }
  }else{
  matrix(sample(c(0, 1), nb_lignes * nb_colonnes, replace = TRUE), nrow = nb_lignes, ncol = nb_colonnes)
}
  }
