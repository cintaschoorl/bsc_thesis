# Geomorphological Mapping using OBIA & Geomorphons

This repository accompanies my thesis project focused on geomorphological landform mapping using object-based image analysis (OBIA), geomorphons, and spatial scripting.

## 🗺️ Overview

This study applies classification techniques using:
- **ArcGIS Pro** for geomorphons, preprocessing and visualization
- **eCognition Developer** for OBIA and rule-based classification
- **Python scripting** (with ArcPy or GDAL) for landscape parameters

### Used or installed packages
- WhiteboxTools: LSP preprocessing with TO-scripting
- GeoPandas: pandas with geometric data for spatial analyses

## 📁 Folder Structure

bsc_thesis/
│
├── data/
│   ├── raw/          # Large raw data not in Git (e.g. .tif, .shp)
│   └── processed/    # Smaller files for sharing (e.g. .geojson, clipped layers)
│
├── scripts/          # Python/ArcPy or other scripts
├── notebooks/        # Optional: analysis in Jupyter or ArcGIS Notebooks
├── ecognition/       # Project files or rulesets (.dcp etc.)
├── outputs/          # Figures, maps, results
├── docs/             # Thesis draft, figures, metadata
├── .gitignore
├── README.md
└── LICENSE
