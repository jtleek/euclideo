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
  nessy::container_with_title("Welcome hero!",is_centered=TRUE,is_rounded=TRUE,
                              tags$p("Sign in to help Euclideo get home!"),
                              tags$br(),
                              tags$br(),
                              useFirebase(),
                              useFirebaseUI()
                              )

  

}
    
#' welcome Server Function
#'
#' @noRd 
mod_welcome_server <- function(input, output, session){
  ns = session$ns
  f = FirebaseUI$
    new(config="./auths/firebase.rds")$ # instantiate
    set_providers( # define providers
      email = TRUE, 
      google = TRUE
    )$
    launch() # launch
  
}
    
## To be copied in the UI
# mod_welcome_ui("welcome_ui")
    
## To be copied in the server
# callModule(mod_welcome_server, "welcome_ui")
 
