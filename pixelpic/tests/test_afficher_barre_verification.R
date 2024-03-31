# Charger le package testthat
library(testthat)

# Définir les tests uniquement si le package testthat est disponible
if (requireNamespace("testthat", quietly = TRUE)) {
  # Test pour la fonction afficher_barre_verification
  test_that("Test de la fonction afficher_barre_verification", {
    # Créer un contexte de test
    context("Affichage de la barre de vérification")
    {
      # Appeler la fonction afficher_barre_verification
      ui <- pixelpic::afficher_barre_verification()

      # Vérifier si le résultat est bien une interface utilisateur Shiny
      expect_is(ui, "shiny.tag.list")

      # Vérifier si la barre de vérification a été affichée correctement
      # Ici, nous vérifions juste le nombre d'éléments dans la liste des tags,
      # vous pouvez également vérifier d'autres attributs comme le style, les étiquettes, etc.
      expect_length(ui, 1)
    }
  })
} else {
  message("Le package testthat n'est pas installé. Les tests ne seront pas exécutés.")
}
