#' Fonction pour calculer les indices d'une ligne ou colonne
#'
#' Cette fonction prend en entrée un vecteur et retourne les longueurs des séquences
#' de valeurs égales à 1, représentant ainsi les indices des cases remplies dans une ligne
#' ou une colonne d'une grille de jeu Picross.
#'
#' @param vec Le vecteur à partir duquel calculer les indices.
#'
#' @return Un vecteur contenant les longueurs des séquences de 1 dans le vecteur d'entrée.
#'
#' @examples
#' # Exemple d'utilisation avec un vecteur
#' vec <- c(1, 0, 1, 1, 1, 0, 0, 1, 1)
#' calculer_indices(vec)
#' # Résultat : 3 2
#'
#' @export
calculer_indices <- function(vec) {
  runs <- rle(vec)
  runs$values[runs$values == 0] <- NA  # Remplacer les valeurs de 0 par NA pour simplifier les calculs

  indices <- runs$lengths[runs$values == 1]
  indices[!is.na(indices)]
}
