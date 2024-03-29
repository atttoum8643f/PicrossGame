library(testthat)

# Définir le test
test_that("Test de la génération de puzzle Picross aléatoire", {
  # Générer un puzzle Picross de taille 5x5
  puzzle_5 <- generer_puzzle_picross(5)
  
  # Vérifier si la taille de la matrice correspond à la taille spécifiée
  expect_equal(dim(puzzle_5), c(5, 5))
  
  # Vérifier si tous les éléments de la matrice sont soit 0 ou 1
  expect_true(all(puzzle_5 %in% c(0, 1)))
  
  # Générer un puzzle Picross de taille 10x10
  puzzle_10 <- generer_puzzle_picross(10)
  
  # Vérifier si la taille de la matrice correspond à la taille spécifiée
  expect_equal(dim(puzzle_10), c(10, 10))
  
  # Vérifier si tous les éléments de la matrice sont soit 0 ou 1
  expect_true(all(puzzle_10 %in% c(0, 1)))
})
