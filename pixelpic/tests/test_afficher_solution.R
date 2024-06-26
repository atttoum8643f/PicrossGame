# Charger le package testthat
library(testthat)

# Définir le test uniquement si le package testthat est disponible
if (requireNamespace("testthat", quietly = TRUE)) {
  # Définir le test
  test_that("Test de la fonction afficher_solution", {
    # Définir une solution de grille Picross et sa taille
    solution <- matrix(c(1, 0, 1, 0, 1, 0, 1, 0, 1,
                         0, 1, 0, 1, 0, 1, 0, 1, 0,
                         1, 0, 1, 0, 1, 0, 1, 0, 1,
                         0, 1, 0, 1, 0, 1, 0, 1, 0,
                         1, 0, 1, 0, 1, 0, 1, 0, 1,
                         0, 1, 0, 1, 0, 1, 0, 1, 0,
                         1, 0, 1, 0, 1, 0, 1, 0, 1,
                         0, 1, 0, 1, 0, 1, 0, 1, 0,
                         1, 0, 1, 0, 1, 0, 1, 0, 1), nrow = 9, ncol = 9)
    taille_grille <- 9

    # Appeler la fonction à tester
    resultat <- pixelpic::afficher_solution(solution, taille_grille, taille_grille)

    # Vérifier si le résultat est une liste de structure HTML
    expect_is(resultat, "list")

    # Vous pouvez ajouter d'autres vérifications au besoin
  })
} else {
  message("Le package testthat n'est pas installé. Les tests ne seront pas exécutés.")
}
