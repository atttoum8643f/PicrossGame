library(testthat)
library(shiny)

# Définir le test
test_that("Test de la création de l'interface utilisateur Shiny pour le jeu Picross", {
  # Appeler la fonction pour créer l'interface utilisateur
  ui <- picfen::create_picross_ui()
  
  # Vérifier si ui est une instance de la classe 'shiny.tag.list'
  expect_is(ui, "shiny.tag.list")
})
