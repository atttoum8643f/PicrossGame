library(testthat)

# Définir le test
test_that("Test des fonctions masquer_barre_verification et montrer_barre_verification", {
  # Définir une matrice représentant le puzzle Picross
  picross <- matrix(c(1, 0, 1, 0, 1,
                      0, 1, 0, 1, 0,
                      1, 0, 1, 0, 1,
                      0, 1, 0, 1, 0,
                      1, 0, 1, 0, 1), nrow = 5, ncol = 5)
  
  # Créer des compteurs pour vérifier si les fonctions sont appelées
  masquer_counter <- 0
  montrer_counter <- 0
  
  # Redéfinir les fonctions pour compter le nombre d'appels
  masquer_barre_verification <- function() {
    masquer_counter <<- masquer_counter + 1
  }
  
  montrer_barre_verification <- function(picross) {
    montrer_counter <<- montrer_counter + 1
  }
  
  # Appeler les fonctions à tester
  masquer_barre_verification()
  montrer_barre_verification(picross)
  
  # Vérifier si les fonctions ont été appelées une fois chacune
  expect_equal(masquer_counter, 1)
  expect_equal(montrer_counter, 1)
})
