# DevInfo to DSD
This repo will walk you through the process of converting a DevInfo Access Database to files that can 


## Preparing your DevInfo data
1. You will need your DevInfo MS Access Database, so locate where that is and make note of the path
2. Install and setup your Jupyter Notebook environment using [Jupyter documentation](https://jupyter.readthedocs.io/en/latest/install.html)
3. Open [Create Access Queries](Create%20Access%20Queries.md) and follow the instructions

## Starting your Jupyter Notebook Environment
As we are using the **[ArcPy](http://pro.arcgis.com/en/pro-app/arcpy/get-started/what-is-arcpy-.htm)** python library, we will need to start our Jupyter Notebook the following way:

- Open ArcGIS Pro
- Click the **Project** tab and click **Python** to access the **Python Package Manager**. To create, edit or remove environments click on the **Manage Environments** button.
- Clone the existing default python environment as the default is read-only. *[reference](http://pro.arcgis.com/en/pro-app/arcpy/get-started/what-is-conda.htm#ESRI_SECTION2_1B154688AEE0497F836B3FFBAAAD0C8C)*
- Find the `pyodbc` package in the list and install it. *[reference](http://pro.arcgis.com/en/pro-app/arcpy/get-started/what-is-conda.htm#ESRI_SECTION2_85BC919097434B3B9AE1A746D793AA29)*
- **IMPORTANT** Open the `Python Command Prompt` and verify the path is to your new, cloned enviornment
- Use the `cd <path>` command to change to your working directory
- From the `Python Command Prompt`, start your Jupyter Notebook server using the `jupyter notebook` command

## Exporting the Data
1. Use `git clone` to clone this repository to a local or working directory.
2. In the Jupyter Notebook web browser, navigate to `notebooks` in your cloned working directory
3. It is recommended to create a new directory under `notebooks` where you can work. 
4. To export statistical/attribute data only (no geometry), follow the instructions in the [Export All Data to Single CSV](notebooks/Export%20All%20Data%20to%20Single%20CSV.ipynb) Jupyter Notebook
5. To export as GeoJSON or File GeoDatabase, follow the instructions in the [Export to GeoJSON or File GeoDatabase with Indicator Attributes](notebooks/Export%20to%20GeoJSON%20or%20File%20GeoDatabase%20with%20Indicator%20Attributes.ipynb) Jupyter Notebook
    - **Note** this step requires that you run the [Export to Shapefiles](notebooks/Export%20to%20Shapefiles.ipynb) Jupyter Notebook first