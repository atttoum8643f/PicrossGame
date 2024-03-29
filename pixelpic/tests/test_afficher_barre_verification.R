# test_afficher_barre_verification.R
# source("C:\\Users\\BossdiDibosS\\Desktop\\MASTER1\\semestre 2\\Programmation R\\shiny\\test_picross\\picfen\\R\\afficher_grille_picross.R")

# Test pour la fonction afficher_barre_verification
test_that("Test de la fonction afficher_barre_verification", {
  # Appeler la fonction afficher_barre_verification
  ui <- afficher_barre_verification()

  # Vérifier si le résultat est bien une interface utilisateur Shiny
  expect_is(ui, "shiny.tag.list")

  # Vérifier si la barre de vérification a été affichée correctement
  # Ici, nous vérifions juste le nombre d'éléments dans la liste des tags,
  # vous pouvez également vérifier d'autres attributs comme le style, les étiquettes, etc.
  expect_length(ui, 1)
})
