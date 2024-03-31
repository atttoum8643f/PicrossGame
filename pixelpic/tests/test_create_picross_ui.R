# Charger les packages nécessaires
library(testthat)
library(shiny)

# Définir le test uniquement si le package testthat est disponible
if (requireNamespace("testthat", quietly = TRUE)) {
  # Définir le test
  test_that("Test de la création de l'interface utilisateur Shiny pour le jeu Picross", {
    # Appeler la fonction pour créer l'interface utilisateur
    ui <- pixelpic::create_picross_ui()

    # Vérifier si ui est une instance de la classe 'shiny.tag.list'
    expect_is(ui, "shiny.tag.list")
  })
} else {
  message("Le package testthat n'est pas installé. Les tests ne seront pas exécutés.")
}
