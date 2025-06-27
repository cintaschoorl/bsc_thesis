install.packages(c("terra","caret"))
library(terra) # raster data
library (caret) # confusion matrices and comparisons

"""
This script computes Cohen's kappa to measure inter-rater reliability 
between the geomorphons and OBIA approach.
"""

#==== prepare data ====
# set data path
data_path <- getwd()

# load .tif raster layers
r_obia <- rast(file.path(data_path, "obia_reclass.tif"))
r_geom <- rast(file.path(data_path, "geom_reclass.tif"))

# check for correct projections (WGS 84 / UTM zone 36S)
lapply(list(r_obia, r_geom), crs)

# resample to same extend/ resolution
r_geom_res <- resample(r_geom, r_obia, method="near")

# convert to 1D vectors for comparison
val_obia <- values(r_obia)
val_geom <- values(r_geom_res)

#==== generate confusion matrix ====
# remove pixels where either is NA
mask <- !is.na(val_obia) & !is.na(val_geom)
val_obia <- val_obia[mask]
val_geom <- val_geom[mask]

# compute Cohen's Kappa
conf_matrix <- confusionMatrix(as.factor(val_obia), as.factor(val_geom))
kappa_val <- conf_matrix$overall['Kappa']
print(sprintf("Kappa agreement: %.3f", kappa_val))

# output full confusion matrix
print(conf_matrix)
