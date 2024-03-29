library(testthat)

# Mock des fonctions pour vérifier si elles sont appelées
activer_mode_noir <- function() {
  assign("mode_noir_called", TRUE, envir = globalenv())
}

activer_mode_croix_rouge <- function() {
  assign("mode_croix_rouge_called", TRUE, envir = globalenv())
}

# Définir le test
test_that("Test des fonctions pour activer les modes", {
  # Appeler les fonctions pour activer les modes
  activer_mode_noir()
  activer_mode_croix_rouge()
  
  # Vérifier si les fonctions ont été appelées
  expect_true(get("mode_noir_called", envir = globalenv()))
  expect_true(get("mode_croix_rouge_called", envir = globalenv()))
})
