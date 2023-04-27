#' kwp() function
#'
#' This function allows you to Perform Kruskal-Wallis test; it shows
#' "~~No significance between groups, try with other dataset~~"
#' if there is no significant between groups in the dataset.
#' Otherwise it will show
#' ~~Observe Significance between groups, continue pairwise_wilcox comparisons~~
#' and calculate pairwise comparisons between groups, showing p value.
#'
#' it will check dplyr package; if hasn't installed it, it will install automatically.
#'
#' Run kwp() and the read file window will prompt out, please locate the dataset which
#' value in the 2nd column and groups in 3rd column.
#'
#' There are some datasets in the data folder; please try them.
#' function code goes here
#'
#' @param xvar the name of the column in the dataset that contains the group names.
#' @param yvar the name of the column in the dataset that contains the values to compare between groups.
#'
#' @return If there is a significant difference between groups, a table with pairwise comparisons and p-values will be printed. Otherwise, a message suggesting to try another dataset will be printed.
#'
#' @examples
#' kwp()
#'
#' @import dplyr
#' @importFrom stats kruskal.test pairwise.wilcox.test
#' @importFrom utils read.csv
#'
#' @export
#'
kwp <- function(file_path = NULL, xvar = NULL, yvar = NULL) {

  # Check if dplyr package is installed, if not install it
  if (!require(dplyr)) {
    install.packages("dplyr")
    library(dplyr)
  }

  # Load data from file path or prompt user to select a file
  if (!is.null(file_path)) {
    my_data <- read.csv(file_path)
  } else {
    my_data <- read.csv(file.choose())
  }

  # Check if xvar and yvar are specified, if not, use the second and third columns
  if (is.null(xvar) & is.null(yvar)) {
    xvar <- names(my_data)[3]
    yvar <- names(my_data)[2]
  }

  # Check levels of xvar column
  my_data[[xvar]] <- factor(my_data[[xvar]])
  cat("Levels of", xvar, "variable: ", levels(my_data[[xvar]]), "\n")

  # Perform Kruskal-Wallis test
  test_result <- kruskal.test(reformulate(xvar, yvar), data = my_data)

  if (test_result$p.value >= 0.05) {
    message("\'~~No significance between groups, try with other dataset~~\'")
  } else {
    message("\'~~Observe Significance between groups, continue pairwise_wilcox comparisons~~\'")

    pairwise_wilcox <- my_data %>%
      select({{yvar}}, {{xvar}}) %>%
      {pairwise.wilcox.test(.[[1]], .[[2]], p.adjust.method = "BH", by = .[[2]])}

    pairwise_wilcox
  }
}
kwp()
