install.packages("devtools")
devtools::install_gitlab("fchianucci/coveR")
library(coveR)
#More info on how this package works at
#https://gitlab.com/fchianucci/coveR

#Set the working directory (you will need to change this)
setwd("C:/Users/s1413233/OneDrive - University of Edinburgh/PhD/Demonstrating/Ecological Measurement/2024/Testing")

rm(list=ls())

#I have saved all of my photos in a folder called 'Photos'
#Only save your photos here, don't save anything else! 

## I first put an example of how to do it just for 1 image
## And then how to do it for all of the images in your folder
## The code to do it for 1 image is just an example to show how it works
## The table you want to produce will be using all of the images 

#######EXAMPLE - FOR 1 IMAGE ##########
#In this case the first image saved in the folder:

#This lists all the file names in the folder where I have my images saved 
images <- list.files("Photos/", full.names = T)

#Now I can get my result of the 'Foliage Cover (FC)' for this photo :)
result <- coveR(images[1]) #The [1] means I am only taking the first listed path name that I saved to the object 'images'
View(result)


######FOR ALL IMAGES###############
#This will now do the same thing but for all of the images in your folder
#We are using what is called a 'for loop'
#This loops through all of the images and does the same line of code for each

#This lists all the file names in the folder where I have my images saved 
images <- list.files("Photos/", full.names = T)

results_all<-NULL #This produces an empty object to which we will then save our results
for (i in 1:length(images)){
  cv<-coveR(images[i]) #This gets the foliage cover for the image
  results_all<-rbind(results_all, cv) #This adds it to the empty dataset we created
}
View(results_all)

#Now we save the file to our laptop!
save.csv(results_all, "FoliageCover.csv")



#image <- system.file('extdata','IMG1.JPG',package='coveR')
