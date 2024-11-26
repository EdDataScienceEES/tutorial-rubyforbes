# Gap Fraction Analysis Tutorial

Welcome to the Gap Fraction Analysis tutorial! This guide will teach you how to use R and the `coveR` package to analyse canopy images and calculate the gap fraction, which is a key metric for understanding canopy openness.

## Learning Objectives

By the end of this tutorial, you will be able to:

1. Install and load the required R packages for canopy analysis.
2. Set up an R environment to analyse canopy images.
3. Perform foliage cover analysis using the `coveR` package.
4. Calculate the gap fraction from foliage cover.
5. Visualise gap fraction results using a bar plot in `ggplot2`.

## Contents of This Repository

- **`Tutorial/`**: Contains all materials for the tutorial.
  - **`Canopy Images/`**: Original images for analysis.
  - **`Example Binary/`**: Processed binary images showing canopy gaps.
  - **`gap_fraction_analysis.Rmd`**: The R Markdown document to follow along with the tutorial.
  - **`gap_fraction_results.csv`**: Example of the generated results after running the analysis.


## Tutorial Overview

In this tutorial, you will:

- Learn how to load and preprocess canopy images.
- Analyse the images to compute foliage cover and gap fractions.
- Visualise the results using bar plots.

The `coveR` package uses Otsu thresholding to convert the original images into binary form, which allows quantifying the gap fraction (the openness in the canopy). The tutorial will guide you through each step, providing real-world context for understanding why gap analysis is crucial for assessing forest health.

## Example Images

Here is an example of what you will do in this tutorial:

### Original Canopy Image



### Binarised Canopy Image

These images illustrate how the `coveR` package helps convert a regular canopy image into a binarised form to calculate the canopy gap fraction effectively.

## Results

At the end of the tutorial, you will have calculated the gap fraction for multiple canopy images and visualised the differences using a bar plot. Example results are saved in the `gap_fraction_results.csv` file.

## Importance of Gap Fraction Analysis

**Gap fraction analysis** is an essential tool for understanding the structure and ecological dynamics of a forest canopy. The **gap fraction** represents the proportion of visible sky when viewed from beneath the canopy, serving as a metric for canopy openness. This openness significantly affects microclimate conditions, species competition, and overall forest health.

**Canopy openness** determines the amount of light that penetrates the canopy, influencing the growth of seedlings and understory vegetation. This variation in light exposure is vital in determining how different species adapt to environmental pressures. It helps forest managers and ecologists assess forest health, predict recovery rates, and understand the dynamics of forest ecosystems.

## Feedback and Contributions

Feel free to submit any issues you find or improvements you suggest via GitHub Issues. Contributions are welcome! If you have additional datasets or analysis ideas, consider submitting a pull request.

## License

This tutorial is licensed under the MIT License. See the `LICENSE` file for details.

**Notes on Images**: The images used in this repository are royalty-free and intended solely for educational and demonstration purposes. These images may have their own usage terms provided by the original sources, and are **not** covered under the MIT License.

If you wish to use these images for other purposes, please verify the original licensing conditions.

