#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    nessy::cartridge(
      nessy::container_with_title("Euclideo",is_centered=TRUE,is_rounded=TRUE,
                                  mod_welcome_ui("welcome_ui"),
                                  mod_progress_bar_ui("progress_bar_ui_1"),
                                  useFirebase(),
                                  useFirebaseUI(),
                                  )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'euclideo'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

