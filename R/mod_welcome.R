#' welcome UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_welcome_ui <- function(id){
  ns <- NS(id)
  uiOutput(ns("welcome"))
}
    
#' welcome Server Function
#'
#' @noRd 
mod_welcome_server <- function(input, output, session, f){
  ns = session$ns
  
  output$welcome = renderUI({
    f$req_sign_out()
    shiny::tagList(
      nessy::balloon("Sign in to help Euclideo get home!", 
                   side = "left"),
      tags$br(),
      tags$img(src="www/img/euclideo.png",
                            height="200")
    )
  })
  

  
}
    
## To be copied in the UI
# mod_welcome_ui("welcome_ui")
    
## To be copied in the server
# callModule(mod_welcome_server, "welcome_ui")
 
