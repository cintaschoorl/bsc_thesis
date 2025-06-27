install.packages(c("sf","dplyr"))
library (sf) # vector data
library(dplyr) # data manipulation

"""
This script test for mean polygon size differences using
two sample t-test between each geomorphons and OBIA class.
"""

#==== prepare data ====
# set data path
data_path <- getwd()

# load .shp vector layers
v_obia <- st_read(file.path(data_path, "obia_polygons.shp"))
v_geom <- st_read(file.path(data_path, "geom_polygons.shp"))

# check for correct projections (WGS 84 / UTM zone 36S)
lapply(list(v_obia, v_geom), st_crs)

# add area column
v_obia <- v_obia %>% mutate(area = st_area(geometry))
v_geom <- v_geom %>% mutate(area = st_area(geometry))

#==== perform t-tests ====
# create named list for results
t_test_results <- list()

# loop through each class
classes <- 1:8
for (c in classes) {
  # extract all areas per class
  area_obia <- as.numeric(v_obia$area[v_obia$gridcode == c])
  area_geom <- as.numeric(v_geom$area[v_geom$gridcode == c])
  
  # only include classes with more than 5 samples in both datasets
  if (length(area_obia) > 5 && length(area_geom) > 5) {
    t_test <- t.test(area_obia, area_geom)
    
    # add to list with key
    t_test_results[[paste0("class_", c)]] <- t_test
    
  } else {
    t_test_results[[paste0("class_", c)]] <- "Not enough data"
  }
}

#==== generate dataframe ====
# initialize empty frame
df_t_tests <- data.frame(
  Class = integer(),
  N_OBIA = integer(), 
  N_Geom = integer(),
  Mean_OBIA = numeric(),
  Mean_Geom = numeric(),
  T_statistic = numeric(),
  P_value = numeric(),
  Significant = character(),
  stringsAsFactors = FALSE
)

# fill dataframe
for (c in classes) {
  result <- t_test_results[[paste0("class_", c)]]
  
  if (class(result) == "htest") {
    area_obia <- as.numeric(v_obia$area[v_obia$gridcode == c])
    area_geom <- as.numeric(v_geom$area[v_geom$gridcode == c])
    
    df_t_tests <- rbind(df_t_tests, data.frame(
      Class = c,
      N_OBIA = length(area_obia),
      N_Geom = length(area_geom),
      Mean_OBIA = mean(area_obia),
      Mean_Geom = mean(area_geom),
      T_statistic = result$statistic,
      P_value = result$p.value,
      Significant = ifelse(result$p.value < 0.05, "Yes", "No")
    ))
  } else {
    df_t_tests <- rbind(df_t_tests, data.frame(
      Class = c,
      N_OBIA = NA,
      N_Geom = NA,
      Mean_OBIA = NA,
      Mean_Geom = NA,
      T_statistic = NA,
      P_value = NA,
      Significant = "Not enough data"
    ))
  }
}

# add class labels and prepare dataframe
class_labels <- c(
  "1" = "Riverbed",
  "2" = "Plateau",
  "3" = "River terrace",
  "4" = "Footslope",
  "5" = "Steep sloping surface",
  "6" = "River valley",
  "7" = "Gently sloping surface",
  "8" = "Alluvial fan"
)

df_t_tests <- df_t_tests %>% 
  mutate(
    Class = as.factor(Class),
    Significant = as.factor(Significant),
    Label = factor(Class, levels = names(class_labels), labels = class_labels)
  )

df_t_tests <- df_t_tests %>% select(Class, Label, everything())

#==== export dataframe ====
write.csv(df_t_tests, file = "t_test_data.csv", row.names = FALSE)
