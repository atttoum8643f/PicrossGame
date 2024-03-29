library(testthat)

# Définissez le test
test_that("Test de la fonction afficher_grille_picross", {
  # Générer une grille Picross aléatoire (exemple)
  picross <- matrix(sample(c(0, 1), 25, replace = TRUE), nrow = 5, ncol = 5)

  # Appelez la fonction à tester
  resultat <- afficher_grille_picross(picross)

  # Vérifier si le résultat est une liste
  expect_is(resultat, "list")
})

