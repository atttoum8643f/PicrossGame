# Charger les scripts d'interface et de serveur
source("R/create_picross_ui.R")
source("R/server.R")
# Définir l'interface utilisateur Shiny
ui <- create_picross_ui()

# Créer l'application Shiny
shinyApp(ui, server)
