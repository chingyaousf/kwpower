#' @title ppt1() function
#'
#' @description
#' This function allows you to create a special plot; it shows
#' the data distribution in a line of a group.
#' You can easy to compare different groups the data distribution in lines.
#'
#' @details
#' It will check ggplot2 package; if hasn't installed it, it will install automatically.
#'
#' The read file window will prompt out, please locate the dataset which
#' values in the 2nd column and groups in 3rd column.
#'
#' There are some datasets in the dataset folder; please try them.
#'
#' @import ggplot2
#' @importFrom stats loess
#'
#' @export
#' @name ppt1
NULL
ppt1 <- function() {
  # Check if ggplot2 package is installed, if not install it
  if (!require("ggplot2")) {
    install.packages("ggplot2")
    library("ggplot2")
  }

  # Prompt user to select a file
  my_data <- read.csv(file.choose())

  X11()
  # Create plot
  group_col <- names(my_data)[3]
  weight_col <- names(my_data)[2]
  my_data[[group_col]] <- as.factor(my_data[[group_col]])
  i <- ggplot(my_data, aes(x = !!sym(group_col), y = !!sym(weight_col), color = !!sym(group_col))) +
    geom_point() +
    geom_smooth(method = "loess") +
    scale_color_viridis_d() +
    theme(legend.position = c(1.5, .8))+
    ggtitle("Data by group")+
    theme(plot.title = element_text(size = 12, color = "red", hjust = 0.5))
  plot(i)
}
ppt1()
