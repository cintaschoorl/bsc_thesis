# Geomorphological Mapping using OBIA & Geomorphons

This repository accompanies my bachelor thesis project at the University of Amsterdam, focused on improving geomorphological classification of the Soutpansberg mountain range, using object-based image analysis (OBIA) and geomorphons techniques.


## 🗺️ Overview

This study applies classification techniques using:
- **ArcGIS Pro** for geomorphons, preprocessing and visualization
- **eCognition Developer** for OBIA segmentation and classification
- **Python scripting** (with ArcPy) for landscape parameters and project operations
- **R studio** for spatial analyses


## 📁 Folder Structure

bsc_thesis/
├── arcpy_scripts/         # Python notebook for ArcPy-based geospatial processing
├── ecognition/            # eCognition process tree ruleset
├── r_scripts/             # R scripts for classification analysis, confusion matrices, and plotting
      └── heatmap_input/     # Intermediate input files for heatmap generation
├── outputs/               # Output maps and tables generated during analysis
├── .gitignore             # Specifies intentionally untracked files to ignore in Git
└── README.md              # Project documentation (this file)



## 📊 Data Access

The project package record can be accessed through Zenodo: DOI 10.5281/zenodo.15753787.

If you'd like access to the full dataset or scripts, ...


## 📌 Notes
* Raw 30m DEM and extension polygon were sourced from the Shuttle Radar Topography Mission, and delivered by dr. Edmore Kori (University of Venda).
* All processing was done in ArcGIS Pro 3.4 and eCognition 10.3.
