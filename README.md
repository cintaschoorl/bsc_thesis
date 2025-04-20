# bsc_thesis

## recommended folder structure

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
