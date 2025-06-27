# Geomorphological Mapping using OBIA & Geomorphons

This repository accompanies my bachelor thesis project at the University of Amsterdam, focused on improving geomorphological classification of the Soutpansberg mountain range, through comparison of object-based image analysis (OBIA) and geomorphons techniques.


## 🗺️ Overview

This study applies classification techniques using:
- **ArcGIS Pro** for geomorphons, preprocessing and visualization
- **eCognition Developer** for OBIA segmentation and classification
- **Python scripting** (with ArcPy) for landscape parameters and project operations
- **R studio** for spatial analyses


## 📁 Folder Structure
<pre> <code>
bsc_thesis
├── arcpy_scripts/         # Python notebook for ArcPy-based geospatial processing
├── ecognition/            # eCognition process tree ruleset
├── outputs/               # Output maps, figures and tables generated during analysis
├── r_scripts/             # R scripts for classification analysis, confusion matrices, and plotting
    └── heatmap_input/     # Intermediate input files for heatmap generation
└── README.md              # Project documentation (this file)
</code> </pre>


## 📊 Data Access

The project archive is available via Zenodo:
🔗 DOI: 10.5281/zenodo.15753787
If you'd like access to the full dataset or processing scripts, feel free to reach out.


## 📌 Notes
* The 30 m DEM was sourced from the Shuttle Radar Topography Mission (SRTM) and  provided by Dr. Edmore Kori (University of Venda) along with a boundary polygon.
* All geospatial processing was conducted using ArcGIS Pro 3.4 and eCognition Developer 10.3.
