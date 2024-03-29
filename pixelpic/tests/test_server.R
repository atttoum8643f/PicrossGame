library(testthat)

# Définir le test
test_that("Test si la fonction server est bien appelée", {
  # Charger le script contenant la logique du serveur Shiny
  source(system.file("R/server.R", package = "pixelpic"))

  # Vérifier si la fonction server est définie
  expect_true(exists("server", where = globalenv()),
              info = "La fonction server n'est pas définie.")
})
