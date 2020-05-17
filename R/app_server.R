#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  f = FirebaseUI$
    new(config="./auths/firebase.rds")$ # instantiate
    set_providers( # define providers
      google = TRUE
    )$
    launch() # launch

  
  callModule(mod_welcome_server, "welcome_ui",f)
  callModule(mod_progress_bar_server, "progress_bar_ui_1",f)
}
