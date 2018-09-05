## Export Shapefiles

This query is used to export a layer id and the three columns needed for a Shapefile.

```
SELECT UT_Area_Map_Layer.Layer_Shp, UT_Area_Map_Layer.Layer_Shx, UT_Area_Map_Layer.Layer_dbf, UT_Area_Map_Layer.Layer_NId, UT_Area_Map_Metadata_en.Layer_Name, UT_Area_en.Area_Parent_NId, UT_Area_en.Area_ID, UT_Area_en.Area_Level, UT_Area_en.Area_Parent_NId
FROM (UT_Area_Map_Layer INNER JOIN UT_Area_Map_Metadata_en ON UT_Area_Map_Layer.Layer_NId = UT_Area_Map_Metadata_en.Layer_NId) INNER JOIN (UT_Area_en INNER JOIN UT_Area_Map ON UT_Area_en.Area_NId = UT_Area_Map.Area_NId) ON UT_Area_Map_Layer.Layer_NId = UT_Area_Map.Layer_NId;

```