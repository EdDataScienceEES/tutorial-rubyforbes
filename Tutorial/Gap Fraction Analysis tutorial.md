### Learning Objectives

By the end of this tutorial, you will be able to:
1. Install and load the required R packages for canopy analysis.
2. Set up an R environment to analyse canopy images.
3. Perform foliage cover analysis using the `coveR` package.
4. Calculate gap fraction from foliage cover.
5. Visualise gap fraction results using a bar plot in `ggplot2`.
### Tutorial Aims

#### <a href="#section1"> 1. Load Required Libraries and Set Up the Environment</a>

This section covers how to load the required packages and set up the working environment needed for the analysis. Specifically, we will ensure all dependencies are installed, load the necessary libraries (`coveR` for canopy analysis and `ggplot2` for visualization), and set the working directory to the correct location where your data is stored.

#### <a href="#section2"> 2. Analyze Canopy Images Using coveR</a>

In this section, we will walk through loading the canopy images and running a foliage cover analysis. We'll start by listing all the images in the designated folder, then perform an initial analysis on one image as a sample, and finally loop through all the images to generate a complete dataset of foliage cover values.

#### <a href="#section3"> 3. Calculate and Visualize Gap Fraction</a>

In this section, we will calculate the gap fraction, which is a measure of the openness in the canopy (calculated as `1 - foliage cover`). We will also visualize the results using a bar plot to easily compare gap fractions across all images.

This tutorial will guide you through using the `coveR` package to analyze canopy images and calculate the gap fraction, a key metric in ecological analysis. We will explore how to load images, calculate foliage cover, and visualize the results using R. By the end of this tutorial, you will be able to analyze your own canopy data and create insightful visualizations.

<center> <img src="/Tutorial/Canopy Images/forest-231066_1280.jpg" alt="Original Canopy Image" style="width: 800px;"/> </center>

<center> <img src="/Tutorial/Example Binary Image/ac7a7694-1fe3-4132-9b0a-a77b760de3f8.png" alt="Binarised Canopy Image" style="width: 800px;"/> </center>

### Example of Image Analysis

The images above show an example of the canopy analysis. The first image is the original canopy image, while the second image is a binarised version generated using the Otsu thresholding method. It converts the original image into a black-and-white representation, which helps quantify the percentage of white space. The white area represents the gap fraction, which indicates openness in the canopy, while the black areas represent foliage cover. The software uses this binary representation to calculate key metrics like foliage cover and gap fraction.


You can get all of the resources for this tutorial from <a href="https://github.com/EdDataScienceEES/tutorial-rubyforbes.git" target="_blank">this GitHub repository</a>. Clone and download the repo as a zip file, then unzip it.

<a name="section1"></a>

## 1. Load Required Libraries and Set Up the Environment

To begin this tutorial, you should open `RStudio`, create a new script by clicking on `File/ New File/ R Script`, set the working directory, and load the required packages. This ensures your R session has all the necessary components to run the analysis.

Now we need to make sure that the required packages are installed. Run the following commands to install the necessary packages:

```r
# Install Required Packages
install.packages("devtools")
devtools::install_gitlab("fchianucci/coveR")
install.packages("ggplot2")
```

```r
# Load Required Libraries
# Load the necessary packages used in the analysis.
library(coveR)        # For canopy image analysis
library(ggplot2)      # For data visualization

# Step 1: Set the Working Directory
# Set your working directory to the folder that contains your images. This ensures R can locate all your files correctly.
# Set the working directory to your local directory where the data is stored
# Replace 'your_filepath' with the path to your local folder
setwd("getwd()") # Use getwd() to see your current working directory, then adjust to your specific data location
```

### Explanation:
- **`library(coveR)`**: Loads the `coveR` package, which is used for analyzing canopy images.
- **`library(ggplot2)`**: Loads `ggplot2`, a powerful data visualization package.
- **`setwd()`**: Sets your working directory so R knows where to look for files.

<a name="section2"></a>

## 2. Analyze Canopy Images Using coveR

Now that we have set up our environment, let's load and analyze the canopy images.

```r
# Step 2: Load Canopy Images
# Create a list of all image files in the "canopy_images" folder.
images <- list.files("canopy_images/", full.names = TRUE)
print(images)  # This checks that the image files have been loaded correctly

# Step 3: Analyse the First Image (Optional Step)
# Perform the foliage cover analysis on the first image to check functionality.
result <- coveR(images[1])
View(result)  # View the result of the first image analysis

# Step 4: Analyse All Images
# Create an empty data frame to store results for all images.
results_all <- NULL

# Loop through all images, calculate foliage cover, and bind the results to 'results_all'.
for (i in 1:length(images)) {
  cv <- coveR(images[i])          # Get the foliage cover (FC) for the current image
  results_all <- rbind(results_all, cv)  # Add the results to the data frame
}

# View all results.
View(results_all)  # This shows the data frame with all the calculated values
```

### Explanation:
- **`list.files()`**: Lists all files in the specified folder. Setting `full.names = TRUE` provides the complete file paths.
- **`coveR()`**: Analyzes each image to determine the foliage cover.
- **Loop through images**: This loop iterates over all images and binds the results into a single data frame.

<a name="section3"></a>

## 3. Calculate and Visualize Gap Fraction

Before diving into the calculations and visualizations, let's briefly describe what Step 3 is doing:

- **Calculate Gap Fraction **: We calculate the gap fraction for each image by subtracting the foliage cover (`FC`) from 1. This is stored in a new column called `gap_fraction` within the `results_all` data frame.
- **Create a Bar Plot **: We use the `ggplot2` package to visualize the gap fraction of each image. The bar plot shows each image's gap fraction, and each bar is filled with a unique color to easily distinguish between images.
- **Export the Results **: Finally, we provide an optional step to export the results to a CSV file. This can be useful for saving the data for later use or further analysis.

In this section, we will calculate the gap fraction for each canopy image and visualize it using a bar plot.

### Step 5: Calculate Gap Fraction
The **gap fraction** is calculated as `1 - foliage cover`. Let's add this information to our data frame.

```r
# Step 5: Calculate Gap Fraction
# Create a new column called 'gap_fraction' in the results_all data frame that contains the gap fraction.
# Gap fraction is calculated as 1 minus the foliage cover (FC) for each image.
results_all$gap_fraction <- 1 - results_all$FC
```

### Step 6: Visualize the Gap Fraction for Each Image
To effectively communicate the results, we create a bar plot where each image's gap fraction is represented by a different color.

```r
# Step 6: Visualize the Gap Fraction for Each Image
# Create a bar plot to visualize the gap fraction for each image, using a different color for each image.
ggplot(results_all, aes(x = id, y = gap_fraction, fill = id)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Gap Fraction for Each Canopy Image",
       x = "Image ID",
       y = "Gap Fraction") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

### Explanation:
- **`ggplot()`**: Initializes the plot using the `results_all` data frame.
- **`aes()`**: Maps `x`, `y`, and `fill` aesthetics to specify how data should be visualized.
- **`geom_bar()`**: Creates the bar plot, using `stat = "identity"` to plot the raw values.
- **`fill = id`**: Ensures each bar has a different color to visually distinguish between images.

### Step 7: Export the Results 
If you wish to save the results for later use, you can export them as a CSV file.

```r
# Step 7: Export the Results 
# If you want to save the results, export them to a CSV file.
write.csv(results_all, "gap_fraction_results.csv", row.names = FALSE)

# This will create a CSV file named "gap_fraction_results.csv" in your current working directory.
```

### Summary
In this tutorial, we learned how to:
- Set up the working environment to use the `coveR` package.
- Analyze canopy images and calculate foliage cover.
- Calculate the gap fraction and create a visualization to better understand the data.

Using these techniques, you can effectively analyze canopy images and present your findings in an engaging way, which is essential for ecological and environmental research.


