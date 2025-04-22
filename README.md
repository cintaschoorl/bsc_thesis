# Geomorphological Mapping using OBIA & Geomorphons

This repository accompanies my bachelor thesis project focused on enhancing geomorphological classification of the Soutpansberg mountain range, using object-based image analysis (OBIA) and geomorphons techniques.


## 🗺️ Overview

This study applies classification techniques using:
- **ArcGIS Pro** for geomorphons, preprocessing and visualization
- **eCognition Developer** for OBIA and rule-based classification
- **Python scripting** (with ArcPy or GDAL) for landscape parameters


### Used or installed packages
- WhiteboxTools: LSP preprocessing with TO-scripting
- GeoPandas: pandas with geometric data for spatial analyses
- rasterio??
- gdal??
- matplotlib: visualizing statistical analyses


## 📁 Folder Structure

bsc_thesis/
│
├── data/
│   ├── raw/          # Large raw data not in Git (e.g. .tif, .shp)
│   └── processed/    # Smaller files for sharing (e.g. .geojson, clipped layers)
│├── scripts/          # Python/ArcPy or other scripts
├── notebooks/        # Optional: analysis in Jupyter or ArcGIS Notebooks
├── ecognition/       # Project files or rulesets (.dcp etc.)
├── outputs/          # Figures, maps, results
├── docs/             # Thesis draft, figures, metadata
├── .gitignore
├── README.md
└── LICENSE


## 📊 Data Access

Due to size and licensing restrictions (?), **raw spatial datasets are not included in this repository**.  
However, processed or derived outputs may be available in `/data/processed/`.

If you'd like access to the full dataset or scripts, contact me.


## 📌 Notes
* Raw DEM and extension polygon were sourced from [source name, e.g., Copernicus/SRTM/USGS].
* All processing was done in ArcGIS Pro 3.4 and eCognition 10.3.
