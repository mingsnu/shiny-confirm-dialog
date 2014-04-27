library(shiny)
values = reactiveValues()
values$dat = data.frame(id = 1:10, name = LETTERS[1:10], grade = round(rnorm(10, 3, 0.5), 2))

shinyServer(function(input, output, session) {
  # An observer is used to send messages to the client.
  # The message is converted to JSON
  observe({
    if(input$deleteConfirmDlgBtn > 0){
      isolate(values$dat <<- values$dat[values$dat$id != input$idSelector,])
    }
    })
  observe({
    if(input$deleteBtn > 0){
      isolate(
      session$sendCustomMessage(type = 'dialogContentUpdate',
                                message = list(id = "deleteConfirmDlg",
                                               message = paste0('Are you sure to delete the record with id number ', 
                                                                input$idSelector)))
      )
    }
  })

  
  output$myTable <- renderDataTable(values$dat)
  })


