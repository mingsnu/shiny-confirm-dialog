source("global.R")

shinyUI(fluidPage(
    singleton(
      tags$head(tags$script(src = "message-handler.js"))
    ),
  
  titlePanel("sendCustomMessage example"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("idSelector", "ID: ", "1", min = 1, max = 10),
            modalTriggerButton("deleteBtn", "#deleteConfirmDlg", "Delete"),
            modalDialog(id="deleteConfirmDlg", footer=list(
              modalTriggerButton("deleteConfirmDlgBtn", "#deleteConfirmDlg", "Delete"),
              tags$button(type = "button", class = "btn btn-primary", 'data-dismiss' = "modal", "Cancel")
              ))
    ),
    mainPanel(
      dataTableOutput("myTable")
    )
  )
))