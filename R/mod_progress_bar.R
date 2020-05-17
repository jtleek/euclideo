#' progress_bar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_progress_bar_ui <- function(id){
  ns <- NS(id)
  uiOutput(ns("progress"))
}
    
#' progress_bar Server Function
#'
#' @noRd 
mod_progress_bar_server <- function(input, output, session,f){
  ns <- session$ns
  

  output$progress =  renderUI({
    f$req_sign_in() 
    user <- f$get_signed_in() # get logged in user info
    nessy::container_simple(
      tags$small("User:"),
      tags$small(user$response$displayName),
      HTML("&nbsp;&nbsp;&nbsp;&nbsp;"),
      tags$small("Fuel:"),
      tags$small("Level:")
      
    )
  })
    
 
}
    
## To be copied in the UI
# mod_progress_bar_ui("progress_bar_ui_1")
    
## To be copied in the server
# callModule(mod_progress_bar_server, "progress_bar_ui_1")
 
