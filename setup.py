# setting up new conda environment
conda create -n thesisenv python=3.10 -y
conda activate thesisenv

# install necessary packages and tools
pip install notebook
pip install whitebox
pip install numpy pandas matplotlib

# navigate to repo-path and activate:
cd ~/OneDrive/Documents/School/FPS/Scriptie/bsc_thesis
conda activate thesisenv


# arcgis conda environment for arcpy etc
conda create -n arcgisenv python=3.11 -y
conda activate arcgisenv
conda install -c esri arcpy=3.3

