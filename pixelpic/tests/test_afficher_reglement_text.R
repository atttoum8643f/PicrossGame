library(testthat)

# Définir le test
test_that("Test de la fonction afficher_reglement_text", {
  # Appeler la fonction à tester
  resultat <- afficher_reglement_text()

  # Vérifier si le résultat est une chaîne de caractères
  expect_is(resultat, "character")

  # Vérifier si le résultat contient le texte du règlement
  expect_match(resultat, "Bienvenue dans le jeu Picross!")
})
