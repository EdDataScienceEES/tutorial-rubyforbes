# Gap Fraction Analysis Tutorial

Welcome to the Gap Fraction Analysis tutorial! This guide will teach you how to use R and the `coveR` package to analyze canopy images and calculate the gap fraction, which is a key metric in understanding canopy openness.

## Learning Objectives
By the end of this tutorial, you will be able to:
1. Install and load the required R packages for canopy analysis.
2. Set up an R environment to analyse canopy images.
3. Perform foliage cover analysis using the `coveR` package.
4. Calculate gap fraction from foliage cover.
5. Visualise gap fraction results using a bar plot in `ggplot2`.

## Contents of This Repository
- **`Tutorial/`**: Contains all materials for the tutorial.
  - **`Canopy Images/`**: Original images for analysis.
  - **`Example Binary/`**: Processed binary images showing canopy gaps.
  - **`gap_fraction_analysis.Rmd`**: The R Markdown document to follow along with the tutorial.
  - **`gap_fraction_results.csv`**: Example of the generated results after running the analysis.

## How to Get Started
To get started with this tutorial:
1. **Clone the Repository**:
    ```sh
    git clone https://github.com/EdDataScienceEES/tutorial-rubyforbes.git
    ```
2. **Open RStudio**: Open the `gap_fraction_analysis.Rmd` file in RStudio.
3. **Install Required Packages**:
    Run the following commands in RStudio to install all the required R packages:
    ```r
    install.packages("devtools")
    devtools::install_gitlab("fchianucci/coveR")
    install.packages("ggplot2")
    ```
4. **Run the Analysis**: Follow the tutorial in the R Markdown file to analyze the images step-by-step.

## Prerequisites
- **R and RStudio**: Make sure you have R (>= 3.5) and RStudio installed.
- **Packages**:
  - `devtools` for installing the `coveR` package.
  - `coveR` for canopy analysis.
  - `ggplot2` for visualization.

## Tutorial Overview
In this tutorial, you will:
- Learn how to load and preprocess canopy images.
- Analyse the images to compute foliage cover and gap fractions.
- Visualise the results using bar plots.

The `coveR` package uses Otsu thresholding to convert the original images into binary form, which allows quantifying the gap fraction (the openness in the canopy). The tutorial will guide you through each step, providing real-world context for understanding why gap analysis is crucial for assessing forest health.

## Example Images
Here is an example of what you will do in this tutorial:

### Original Canopy Image
![Original Canopy Image](Tutorial/Canopy%20Images/forest-231066_1280.jpg)

### Binarised Canopy Image
![Binarised Canopy Image](Tutorial/Example%20Binary%20Image/ac7a7694-1fe3-4132-9b0a-a77b760de3f8.png)

These images illustrate how the `coveR` package helps convert a regular canopy image into a binarised form to calculate the canopy gap fraction effectively.

## Results
At the end of the tutorial, you will have calculated the gap fraction for multiple canopy images, and visualised the differences using a bar plot. Example results are saved in the `gap_fraction_results.csv` file.

## Feedback and Contributions
Feel free to submit any issues you find or improvements you suggest via GitHub Issues. Contributions are welcome! If you have additional datasets or analysis ideas, consider submitting a pull request.

## License
This tutorial is licensed under the MIT License. See the `LICENSE` file for details.


