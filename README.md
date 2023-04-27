---
editor_options:
  markdown:
    wrap: 72
output: pdf_document
---

### kwpower Package

The kwpower package allows users to perform a Kruskal-Wallis Test for
multiple pairwise comparisons of three or more groups with continuous
but not normally distributed data. The main function in this package is
called kwp().

It comes with two additional functions, ppt1() and ppt2(), which
generate plots for easy comparison. Users can input their dataset, and
the plots will be automatically generated.

### Functions

**kwp()**

The function performs the Kruskal-Wallis test to compare the variable
across the different groups. The resulting test statistic, degrees of
freedom, and p-value are saved in the kwp variable.

**ppt1()**

This function creates a "special plot" that displays the data
distribution in a line for each group, making it easy to compare the
data distributions across different groups.

**ppt2()**

This function creates a "box plot" that makes it easy to compare the
data across different groups. A box plot displays the median, quartiles,
and outliers of each group's data.

### Additional Information

One of the key features of the kwpower package is its ability to test
any type of CSV data and generate plots with a structure that includes
values in the 2nd column and groups in the 3rd column. To read a CSV
file, users can choose the file interactively using a dialog box.

**With just a few clicks, users can perform their analysis easily.**

### References

Mann-Whitney U Test in R

<https://stat-methods.com/home/mann-whitney-u-r>

Kruskal-Wallis Test in R

<http://www.sthda.com/english/wiki/kruskal-wallis-test-in-r#what-is-kruskal-wallis-test>
