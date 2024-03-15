#' Activer les modes "Noir" et "Croix Rouge"
#'
#' @export
activer_modes <- function() {
  activer_mode_noir()
  activer_mode_croix_rouge()
}

#' Activer le mode "Noir"
#'
#' @export
activer_mode_noir <- function() {
  shinyjs::runjs("
    var modeNoir = false;  // Variable pour indiquer si le mode est activé ou non
    $('.cellulePicross').click(function() {
      if (modeNoir) {
        var cellule = $(this);
        cellule.css('background-color', 'black');
        // Réinitialiser l'icône de croix rouge si elle existe
        cellule.html('');
      }
    });

    // Ajouter une classe CSS pour indiquer que le mode est actif
    $('.cellulePicross').addClass('modeNoirActive');
  ")
}

#' Activer le mode "Croix Rouge"
#'
#' @export
activer_mode_croix_rouge <- function() {
  shinyjs::runjs("
    var modeCroixRouge = false;  // Variable pour indiquer si le mode est activé ou non
    $('.cellulePicross').click(function() {
      if (modeCroixRouge) {
        var cellule = $(this);
        cellule.css('background-color', 'white');  // Couleur de fond blanc pour simuler une croix rouge
        cellule.html('<i class=\"fas fa-times\" style=\"color: red;\"></i>');  // Ajouter une icône de croix rouge
      }
    });

    // Ajouter une classe CSS pour indiquer que le mode est actif
    $('.cellulePicross').addClass('modeCroixRouge');
  ")
}
