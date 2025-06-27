install.packages(c("foreign", "caret", "ggplot2"))
library(foreign)   # read .dbf files
library(dplyr)     # data manipulation
library(ggplot2)   # plotting
library(caret)     # confusionMatrix

"""
This script reads classified points from geomorphons and OBIA compared to 
validation points, and visualizes heatmaps from confusion matrix data.
"""

# ==== prepare data ====
# read .dbf tables of validation and classified points
p_obia <- read.dbf("OBIA_ValPoints.dbf")
p_geom <- read.dbf("Geom_ValPoints.dbf")

# add point IDs
p_obia <- p_obia %>% mutate(point_id = row_number())
p_geom <- p_geom %>% mutate(point_id = row_number())

# rename relevant columns
p_obia <- p_obia %>% rename(obia_class = Classified, expert_class = GrndTruth)
p_geom <- p_geom %>% rename(geom_class = Classified, expert_class = GrndTruth)

# join and rearrange data 
p_geom_clean <- p_geom %>% select(point_id, geom_class)
df_points <- left_join(p_obia, p_geom_clean, by = "point_id") %>%
  select(point_id, expert_class, obia_class, geom_class) %>%
  mutate(
    expert_class = as.factor(expert_class),
    obia_class = as.factor(obia_class),
    geom_class = as.factor(geom_class)
  )

# ==== generate confusion matrices ====
conf_matrix_obia <- confusionMatrix(df_points$obia_class, df_points$expert_class)
conf_matrix_geom <- confusionMatrix(df_points$geom_class, df_points$expert_class)

# extract accuracy and kappa
overall_acc_obia <- round(conf_matrix_obia$overall['Accuracy'] * 100, 2)
kappa_obia <- round(conf_matrix_obia$overall['Kappa'], 2)

overall_acc_geom <- round(conf_matrix_geom$overall['Accuracy'] * 100, 2)
kappa_geom <- round(conf_matrix_geom$overall['Kappa'], 2)

# ==== helper function for heatmap conversion ====
create_heatmap_data <- function(cm_data) {
  df <- as.data.frame(cm_data$table)
  colnames(df) <- c("Prediction", "Reference", "Freq")
  
  df <- df %>%
    group_by(Reference) %>%
    mutate(Percentage = Freq / sum(Freq) * 100) %>%
    ungroup()
  
  df$Prediction <- factor(df$Prediction, levels = rev(levels(df$Prediction)))
  df$Reference <- factor(df$Reference, levels = levels(df$Reference))
  return(df)
}

# generate heatmap data
heatmap_data_obia <- create_heatmap_data(conf_matrix_obia)
heatmap_data_geom <- create_heatmap_data(conf_matrix_geom)

# ==== plot function ====
plot_heatmap <- function(cm_df, title_text, subtitle_text, filename) {
  p <- ggplot(data = cm_df, aes(x = Reference, y = Prediction, fill = Freq)) +
    geom_tile() +
    geom_text(aes(label = Freq), color = "white", size = 4) +
    scale_fill_gradient(low = "steelblue", high = "darkblue", name = "Frequency") +
    theme_minimal() +
    theme(
      legend.title = element_text(size = 9),
      plot.title = element_text(hjust = 0.5),
      plot.subtitle = element_text(hjust = 0.5)
    ) +
    ggtitle(label = title_text, subtitle = subtitle_text) +
    xlab("Actual") +
    ylab("Predicted")
  
  print(p)
  ggsave(filename, plot = p, width = 7, height = 7, dpi = 300)
}

# ==== plot and save both heatmaps ====
plot_heatmap(
  heatmap_data_obia,
  "OBIA Classification Confusion Matrix",
  paste0("Accuracy: ", overall_acc_obia, "%, Kappa: ", kappa_obia),
  "obia_cm_heatmap.png"
)

plot_heatmap(
  heatmap_data_geom,
  "Geomorphons Classification Confusion Matrix",
  paste0("Accuracy: ", overall_acc_geom, "%, Kappa: ", kappa_geom),
  "geom_cm_heatmap.png"
)
