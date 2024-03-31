# Charger le package testthat
library(testthat)

# Définir le test uniquement si le package testthat est disponible
if (requireNamespace("testthat", quietly = TRUE)) {
  # Définir le test
  test_that("Test de la fonction afficher_grille_picross", {
    # Définir la taille de la grille pour l'exemple
    nb_lignes <- 5
    nb_colonnes <- 5

    # Générer une grille Picross aléatoire (exemple)
    picross <- matrix(sample(c(0, 1), nb_lignes * nb_colonnes, replace = TRUE), nrow = nb_lignes, ncol = nb_colonnes)

    # Appelez la fonction à tester
    resultat <- pixelpic::afficher_grille_picross(picross)

    # Vérifier si le résultat est une liste
    expect_is(resultat, "list")
  })
} else {
  message("Le package testthat n'est pas installé. Les tests ne seront pas exécutés.")
}
