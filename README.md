# DevInfo to DSD
This repo will walk you through the process of converting a DevInfo Access Database to files that can be published to your ArcGIS Hub (Open Data) site.


## Getting Started
1. You will need your DevInfo MS Access Database, so locate where that is and make note of the path
2. Install and setup your Jupyter Notebook environment using [Jupyter documentation](https://jupyter.readthedocs.io/en/latest/install.html)

## Starting your Jupyter Notebook Environment
- Use the `cd <path>` command to change to your working directory
- From the `Python Command Prompt`, start your Jupyter Notebook server using the `jupyter notebook` command

## Exporting the Data
1. Use `git clone` to clone this repository to a local or working directory.
2. In the Jupyter Notebook web browser, navigate to `notebooks` in your cloned working directory
3. It is recommended to create a new directory under `notebooks` where you can work. 
4. To export statistical/attribute data only (no geometry), follow the instructions in the [Export All Data to Single CSV](notebooks/Export%20All%20Data%20to%20Single%20CSV.ipynb) Jupyter Notebook
5. To export as GeoJSON or File GeoDatabase, follow the instructions in the [Export to GeoJSON or File GeoDatabase with Indicator Attributes](notebooks/Export%20to%20GeoJSON%20or%20File%20GeoDatabase%20with%20Indicator%20Attributes.ipynb) Jupyter Notebook
    - **Note** this step requires that you run the [Export to Shapefiles](notebooks/Export%20to%20Shapefiles.ipynb) Jupyter Notebook first

## How Can I Contribute?
Please see the [guidelines for contributing](CONTRIBUTING.md) if you'd like to help work on the project.