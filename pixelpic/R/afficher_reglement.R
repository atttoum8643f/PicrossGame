#' Afficher les détails du jeu
#'
#' Cette fonction génère les détails du jeu Picross en texte.
#'
#' @return Les détails du jeu en texte
#' @export
#'
afficher_reglement_text <- function() {
  "Le but consiste à retrouver les cases noires dans chaque grille. Les chiffres
  donnés sur le côté et en haut de la grille vous donnent des indices. Ils indiquent
  la taille des blocs de cases noires de la ligne ou de la colonne sur laquelle ils
  se trouvent.\n\nPar exemple 3,4 à gauche d'une ligne indique qu'il y a, de gauche
  à droite, un bloc de 3 cases noires puis un bloc de 4 cases noires sur cette ligne.\n
  \nEn revanche, ce qui n'est pas mentionné et qui fait la difficulté, est le nombre de
  cases blanches entre les cases noires. On sait simplement qu'il y en a au moins une.\n
  \nGénéralement, une grille résolue fait découvrir un dessin."
}
