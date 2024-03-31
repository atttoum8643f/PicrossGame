# Charger le package testthat
library(testthat)

# Définir le test uniquement si le package testthat est disponible
if (requireNamespace("testthat", quietly = TRUE)) {
  # Définir le test
  test_that("Test de la fonction afficher_reglement_text", {
    # Appeler la fonction à tester
    resultat <- pixelpic::afficher_reglement_text()

    # Vérifier si le résultat contient le texte attendu du règlement
    expect_match(resultat, "Le but consiste à retrouver les cases noires dans chaque grille. Les chiffres
  donnés sur le côté et en haut de la grille vous donnent des indices. Ils indiquent
  la taille des blocs de cases noires de la ligne ou de la colonne sur laquelle ils
  se trouvent.\n\nPar exemple 3,4 à gauche d'une ligne indique qu'il y a, de gauche
  à droite, un bloc de 3 cases noires puis un bloc de 4 cases noires sur cette ligne.\n
  \nEn revanche, ce qui n'est pas mentionné et qui fait la difficulté, est le nombre de
  cases blanches entre les cases noires. On sait simplement qu'il y en a au moins une.\n
  \nGénéralement, une grille résolue fait découvrir un dessin.")
  })
} else {
  message("Le package testthat n'est pas installé. Les tests ne seront pas exécutés.")
}
