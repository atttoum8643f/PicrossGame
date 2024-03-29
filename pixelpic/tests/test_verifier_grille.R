library(testthat)

# Définir une variable globale pour indiquer si la fonction a été appelée
ma_fonction_appelee <- FALSE

# Redéfinir la fonction pour qu'elle définisse la variable globale
ma_fonction <- function() {
  # Votre logique existante ici
  
  # Définir la variable globale indiquant que la fonction a été appelée
  ma_fonction_appelee <<- TRUE
}

# Test de la fonction pour s'assurer qu'elle est appelée
test_that("Test de l'appel de ma_fonction", {
  # Appeler la fonction
  ma_fonction()
  
  # Vérifier si la variable globale a été définie
  expect_true(ma_fonction_appelee, "La fonction ma_fonction doit être appelée.")
})
