# DevInfo to DSD
This repo will walk you through the process of converting a DevInfo Access Database to files that can be published to your ArcGIS Hub (Open Data) site.


## Getting Started
1. You will need your DevInfo MS Access Database, so locate where that is and make note of the path
2. Install and setup your Jupyter Notebook environment using [Jupyter documentation](https://jupyter.readthedocs.io/en/latest/install.html)

## Starting your Jupyter Notebook Environment
- Use the `cd <path>` command to change to your working directory
- From the `Python Command Prompt`, start your Jupyter Notebook server using the `jupyter notebook` command

## Create your working directory
1. Use `git clone` to clone this repository to a local or working directory.
2. In the Jupyter Notebook web browser, navigate to `notebooks` in your cloned working directory
3. It is recommended to create a new directory under `notebooks` where you can work. Example `notebooks/mycountryname`

## Exporting the Data
1. Run the [Export to Shapefiles](notebooks/Export%20to%20Shapefiles.ipynb) Jupyter Notebook first
to export the Shapefiles to serve as the geographical data

2. Run the [Export All Data to Single CSV](notebooks/Export%20All%20Data%20to%20Single%20CSV.ipynb) Jupyter Notebook to generate a single CSV file that will have the statistical data from the access database.

3. Run the [Export GeoJSON to File Geodatabase](notebooks/Export%20GeoJSON%20to%20File%20Geodatabase.ipynb) Jupyter Notebook to join your exported CSV file (from step 2) to your spatial data (from step 1).

4. _Optional_ Run the [Export GeoJSON to File Geodatabase](notebooks/Export%20GeoJSON%20to%20File%20Geodatabase.ipynb) Jupyter Notebook to create a File Geodatabase and export each GeoJSON file (from step 3) to a feature class

## How Can I Contribute?
Please see the [guidelines for contributing](CONTRIBUTING.md) if you'd like to help work on the project.