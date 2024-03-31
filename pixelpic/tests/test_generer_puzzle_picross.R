# Charger les packages nécessaires
library(testthat)

# Définir le test uniquement si le package testthat est disponible
if (requireNamespace("testthat", quietly = TRUE)) {
  # Définir le test
  test_that("Test de la génération de puzzle Picross aléatoire", {
    # Générer un puzzle Picross de taille 5x5
    puzzle_5 <- pixelpic::generer_puzzle_picross(5, 5)

    # Vérifier si la taille de la matrice correspond à la taille spécifiée
    expect_equal(dim(puzzle_5), c(5, 5))

    # Vérifier si tous les éléments de la matrice sont soit 0 ou 1
    expect_true(all(puzzle_5 %in% c(0, 1)))

    # Générer un puzzle Picross de taille 10x10
    puzzle_10 <- pixelpic::generer_puzzle_picross(10, 10)

    # Vérifier si la taille de la matrice correspond à la taille spécifiée
    expect_equal(dim(puzzle_10), c(10, 10))

    # Vérifier si tous les éléments de la matrice sont soit 0 ou 1
    expect_true(all(puzzle_10 %in% c(0, 1)))
  })
} else {
  message("Le package testthat n'est pas installé. Les tests ne seront pas exécutés.")
}
