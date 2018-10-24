# DevInfo to DSD
This repo will walk you through the process of converting a DevInfo Access Database to files that can be published to your ArcGIS Hub (Open Data) site.


## Getting Started
1. You will need your DevInfo MS Access Database, so locate where that is and make note of the path
2. Install and setup your Jupyter Notebook environment using [Jupyter documentation](https://jupyter.readthedocs.io/en/latest/install.html)
    - It's recommended to [download and install Anaconda](https://docs.continuum.io/anaconda/install/), which will include Jupyter Notebook 
3. Install [Jupyter Widgets](https://ipywidgets.readthedocs.io/en/stable/user_install.html)
    - If you are using [Jupyter Lab](), you will also need to run this command to enable the widgets:
    
      `jupyter labextension install @jupyter-widgets/jupyterlab-manager`

      More info can be found [here](https://ipywidgets.readthedocs.io/en/stable/user_install.html#installing-the-jupyterlab-extension)

## Starting your Jupyter Notebook Environment
- Use the `cd <path>` command to change to your working directory
- From the `Python Command Prompt`, start your Jupyter Notebook server using the `jupyter notebook` command

## Create your working directory
1. Use `git clone` to clone this repository to a local or working directory.
2. In the Jupyter Notebook web browser, navigate to `notebooks` in your cloned working directory
3. It is recommended to create a new directory under `notebooks` where you can work. Example `notebooks/mycountryname`

## Exporting the Data
1. Run the [Export All Data to Single CSV](notebooks/Export%20All%20Data%20to%20Single%20CSV.ipynb) Jupyter Notebook to generate a single CSV file that will have the statistical data from the access database.

2. Run the [Export DevInfo Access Database Shapefiles to GeoJSON](notebooks/Export%20DevInfo%20Access%20Database%20Shapefiles%20to%20GeoJSON.ipynb) Jupyter Notebook first
to export the Shapefiles stored in the DevInfo Access Database as GeoJSON files.

3. Run the [CSV to GeoJSON with Indicator Attributes](notebooks/CSV%20to%20GeoJSON%20with%20Indicator%20Attributes.ipynb) Jupyter Notebook to join your exported CSV file (from step 1) to your GeoJSON files (from step 2).

4. [Optional] Run the [Export GeoJSON to File Geodatabase](notebooks/Export%20GeoJSON%20to%20File%20Geodatabase.ipynb) Jupyter Notebook to create a File Geodatabase and export each GeoJSON file (from step 3) to a feature class

## How Can I Contribute?
Please see the [guidelines for contributing](CONTRIBUTING.md) if you'd like to help work on the project.