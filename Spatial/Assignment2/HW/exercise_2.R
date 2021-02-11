##-----------------------------------------------##
##    Author: Hanna Matera                    ##
##    Institute of Culture and Society           ##
##    Aarhus University, Aarhus, Denmark         ##
                          
##-----------------------------------------------##

#### Goals ####

# - Understand the provided datasets
# - Learn how to reproject spatial data
# - Limit your data into an area of interest
# - Create a new map

# We highlighted all parts of the R script in which you are supposed to add your
# own code with: 

# /Start Code/ #

print("Hello World") # This would be your code contribution

# /End Code/ #

#### Required R libraries ####

# We will use the sf, raster, and tmap packages.
# Additionally, we will use the spData and spDataLarge packages that provide new datasets. 
# These packages have been preloaded to the worker2 workspace.

library(sf)
library(raster)
library(tmap)
library(spData)
library(spDataLarge)

#### Data sets #### 

# We will use two data sets: `srtm` and `zion`.
# The first one is an elevation raster object for the Zion National Park area, and the second one is an sf object with polygons representing borders of the Zion National Park.

srtm <- raster(system.file("raster/srtm.tif", package = "spDataLarge"))
zion <- read_sf(system.file("vector/zion.gpkg", package = "spDataLarge"))

# Additionally, the last exercise (IV) will used the masked version of the `lc_data` dataset.

study_area <- read_sf("HW/data/study_area.gpkg")
lc_data <- raster("HW/data/example_landscape.tif")
lc_data_masked <- mask(crop(lc_data, study_area), study_area)

#### Exercise I ####

# 1. Display the `zion` object and view its structure.

# /Start Code/ #

# What can you say about the content of this file?
# The file contains a list of geospatial coordinates which specify the polygonal stucture of the park borders and additional information such as the name of the Park or State where it is located   
head(zion)

# What type of data does it store? 
# Polygons

# What is the coordinate system used?
st_crs(zion)
# it is GRS80

# How many attributes does it contain?
ncol(zion)
#12 columns 

# What is its geometry?
#geometry type: POLYGON

# 2. Display the `srtm` object and view its structure.
# What can you say about the content of this file? 
head(srtm)
#This is a raster file which contains a number of matrices representing multiple layers of the map (grid cells)

# What type of data does it store?
# this data stores information about different layers, legend information 

# What is the coordinate system used? 
crs(srtm)
#WGS84

# How many attributes does it contain?
#we are in doubt as to what constitutes attributes of the raster data, however if by attributes it is meant how many columns data contains the number is 6 (distinct columns with different information)

# How many dimensions does it have?
dim(srtm)
#data contains 2 dimensions: width and height (1 layer) ; nrows=457, ncol=465,   1

# What is the data resolution?
res(srtm)
# 0.0008333333 0.0008333333


# /End Code/ #

#### Exercise II ####

# Your solution

# /Start Code/ #

# 1. Reproject the `srtm` dataset into the coordinate reference system used in the `zion` object.
# Create a new object `srtm2`
st_crs(zion) # GRS1980 
st_crs(srtm)  #WGS84 -> to GRS1980

#assigning the GRS 1980 system to srtm object
crs_1 <- "+proj=utm +zone=18 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"

#saving it as srtm2
srtm2 <- strm
crs(srtm2) <- crs_1  # crs 


# Vizualize the results using the `plot()` function.
plot(srtm2)

# 2. Reproject the `zion` dataset into the coordinate reference system used in the `srtm` object.
st_crs(zion) # GRS1980 -> to WGS84
st_crs(srtm)  #WGS84 

crs_2 <- "+proj=longlat +ellps=WGS84 +no_defs"


#transforming to WGS84 and savinh as zion2
zion2 <- st_transform(zion, crs =crs_2)

#checking if the object zion changed into WDS84
st_crs(zion2)

# Vizualize the results using the `plot()` function.
plot(zion2)


# /End Code/ #


