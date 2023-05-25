#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  df <- reactive({
    req(input$in_file)
    read.csv2(input$in_file$datapath)
  })

  df_out <- reactive({
    req(df())
    df() %>%
      add_number_to_df()
  })

  output$in_table <- renderTable({
    req(input$in_file)
    df()
    })

  output$out_table <- renderTable({
    req(df_out())
    df_out()
  })

  output$download <- downloadHandler(
    filename = "out_table.csv",
    content = function(file) {
      req(df_out())

      write.csv2(df_out(), file, row.names = FALSE, quote = FALSE)
    }
  )
}
