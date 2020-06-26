# sample shiny app for language detection :

library(shiny)
library(dplyr)
library(cld2)

# define shiny app for language detection :

ui <- fluidPage(
    
    titlePanel(
      h1("Language Detector", align = "center")
    ),
    
    textInput("text", "Please enter text in any language", "Ex :Hallo, wie geht es dir ?"),
    actionButton(inputId = "submit", label = "Submit"),
    verbatimTextOutput("text", placeholder = TRUE)
    
  )
  
server <- function(input, output){
    
    display_text <- eventReactive(input$submit, {

      if(input$text != ""){

      language <- cld2::detect_language(text = input$text, lang_code = FALSE)  
      output$text <- renderPrint({paste0("The detected language is :", language)})

      }else {

      output$text <- renderPrint({"Please enter some text for language detection !"})
    }
  })

   observe(display_text()) 
}
  
shinyApp(ui, server)