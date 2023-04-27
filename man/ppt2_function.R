#' @title ppt2() function
#'
#' @description
#' This function allows you to create a box plot; A box plot displays the median
#' ,quartiles, and outliers of each group's data.You can easy to compare different groups.
#'
#' @details
#' It will check ggpubr package; if hasn't installed it, it will install automatically.
#'
#' The read file window will prompt out, please locate the dataset which
#' values in the 2nd column and groups in 3rd column.
#'
#' There are some datasets in the dataset folder; please try them.
#'
#' @import ggpubr
#'
#' @export
#' @name ppt2
NULL
ppt2 <- function(file_path = NULL, group_col = NULL, weight_col = NULL) {
  # Check if ggpubr package is installed, if not install it
  if (!require("ggpubr")) {
    install.packages("ggpubr")
    library("ggpubr")
  }

  # Load data from file path or prompt user to select a file
  if (!is.null(file_path)) {
    my_data <- read.csv(file_path)
  } else {
    my_data <- read.csv(file.choose())
  }

  # Set default values for group_col and weight_col
  if (is.null(group_col)) {
    group_col <- names(my_data)[3]
  }
  if (is.null(weight_col)) {
    weight_col <- names(my_data)[2]
  }
  x11()

  # Create plot
  group_levels <- unique(my_data[[group_col]])
  palette <- viridisLite::viridis(length(group_levels))
  names(palette) <- group_levels
  j <- ggboxplot(my_data, x = group_col, y = weight_col,
                 color = group_col, palette = palette,
                 ylab = weight_col, xlab = group_col)
  plot(j)
}
ppt2()
