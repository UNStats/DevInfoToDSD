library(data.table)

setwd("C:/Users/L.GonzalezMorales/Documents/PROJ - DevInfoToDSD/nepal")



#-----------------------------------------------------------------------------
# List of countreis to be plotted on a map (with XY coordinates)
#------------------------------------------- ----------------------------------

DevInfoRaw <- as.data.table(read.table("output/devinfo_output_nepal.csv", 
                                          header = TRUE, 
                                          sep = ",",
                                          quote = "\"" ,
                                          na.strings = "", 
                                          stringsAsFactors = FALSE,
                                          encoding = "UTF-8"))


DevInfoRawDimensions <- unique(DevInfoRaw[,list(INDICATOR_ID,
                                                INDICATOR,
                                                SUBGROUP_TYPE_NAME,
                                                SUBGROUP_VAL)])



write.table(DevInfoRawDimensions, 
            file = "EditDevInfoDimensions-Nepal.txt", 
            append = FALSE,
            quote = FALSE, 
            sep = "\t",
            eol = "\n", 
            na = "", 
            dec = ".", 
            row.names = FALSE,
            col.names = TRUE, 
            fileEncoding = "UTF-8")

#=============================================================
# "NepalInfo2016-DimensionsMapping.txt" is produced offline 
# based on the output of the previous steps
#============================================================

NepalInfo2016.DimensionsMapping <- as.data.table(read.table("NepalInfo2016-DimensionsMapping.txt", 
                                       header = TRUE, 
                                       sep = "\t",
                                       quote = "" ,
                                       na.strings = "", 
                                       stringsAsFactors = FALSE,
                                       encoding = "UTF-8"))


mapped <- merge(DevInfoRaw,
                NepalInfo2016.DimensionsMapping,
                all = TRUE)


write.table(mapped, 
            file = "MappedDevInfoDimensions-Nepal.txt", 
            append = FALSE,
            quote = FALSE, 
            sep = "\t",
            eol = "\n", 
            na = "", 
            dec = ".", 
            row.names = FALSE,
            col.names = TRUE, 
            fileEncoding = "UTF-8")


#=============================================================
# PRODUCE DSD
#============================================================

#-----------------------------
# Get a list of all dimensions
#=----------------------------
NewDimensions <- unique(rbind(unique(mapped[,list(Dimension=NewDimension1, Level=NewLevel1)]),
                              unique(mapped[,list(Dimension=NewDimension2,  Level=NewLevel2)]),
                              unique(mapped[,list(Dimension=NewDimension3,  Level=NewLevel3)]),
                              unique(mapped[,list(Dimension=NewDimension4,  Level=NewLevel4)])))


NewDimensions <- NewDimensions[order(Dimension,Level)]

NewDimensions <- na.omit(NewDimensions, cols="Dimension")

unique(NewDimensions[,Dimension])

mapped[NewDimension1=="Age",Age:=NewLevel1]
mapped[NewDimension2=="Age",Age:=NewLevel2]
mapped[NewDimension3=="Age",Age:=NewLevel3]
mapped[NewDimension4=="Age",Age:=NewLevel4]

mapped[NewDimension1=="CasteEthnicity",CasteEthnicity:=NewLevel1]
mapped[NewDimension2=="CasteEthnicity",CasteEthnicity:=NewLevel2]
mapped[NewDimension3=="CasteEthnicity",CasteEthnicity:=NewLevel3]
mapped[NewDimension4=="CasteEthnicity",CasteEthnicity:=NewLevel4]

mapped[NewDimension1=="Citizenship",Citizenship:=NewLevel1]
mapped[NewDimension2=="Citizenship",Citizenship:=NewLevel2]
mapped[NewDimension3=="Citizenship",Citizenship:=NewLevel3]
mapped[NewDimension4=="Citizenship",Citizenship:=NewLevel4]

mapped[NewDimension1=="CivilServiceLevel",CivilServiceLevel:=NewLevel1]
mapped[NewDimension2=="CivilServiceLevel",CivilServiceLevel:=NewLevel2]
mapped[NewDimension3=="CivilServiceLevel",CivilServiceLevel:=NewLevel3]
mapped[NewDimension4=="CivilServiceLevel",CivilServiceLevel:=NewLevel4]

mapped[NewDimension1=="Dependent",Dependent:=NewLevel1]
mapped[NewDimension2=="Dependent",Dependent:=NewLevel2]
mapped[NewDimension3=="Dependent",Dependent:=NewLevel3]
mapped[NewDimension4=="Dependent",Dependent:=NewLevel4]

mapped[NewDimension1=="DisabilityType",DisabilityType:=NewLevel1]
mapped[NewDimension2=="DisabilityType",DisabilityType:=NewLevel2]
mapped[NewDimension3=="DisabilityType",DisabilityType:=NewLevel3]
mapped[NewDimension4=="DisabilityType",DisabilityType:=NewLevel4]

mapped[NewDimension1=="ExpenditureType",ExpenditureType:=NewLevel1]
mapped[NewDimension2=="ExpenditureType",ExpenditureType:=NewLevel2]
mapped[NewDimension3=="ExpenditureType",ExpenditureType:=NewLevel3]
mapped[NewDimension4=="ExpenditureType",ExpenditureType:=NewLevel4]

mapped[NewDimension1=="HealthInstitutionType",HealthInstitutionType:=NewLevel1]
mapped[NewDimension2=="HealthInstitutionType",HealthInstitutionType:=NewLevel2]
mapped[NewDimension3=="HealthInstitutionType",HealthInstitutionType:=NewLevel3]
mapped[NewDimension4=="HealthInstitutionType",HealthInstitutionType:=NewLevel4]

mapped[NewDimension1=="Location",Location:=NewLevel1]
mapped[NewDimension2=="Location",Location:=NewLevel2]
mapped[NewDimension3=="Location",Location:=NewLevel3]
mapped[NewDimension4=="Location",Location:=NewLevel4]

mapped[NewDimension1=="MaritalStatus",MaritalStatus:=NewLevel1]
mapped[NewDimension2=="MaritalStatus",MaritalStatus:=NewLevel2]
mapped[NewDimension3=="MaritalStatus",MaritalStatus:=NewLevel3]
mapped[NewDimension4=="MaritalStatus",MaritalStatus:=NewLevel4]

mapped[NewDimension1=="MotherTongue",MotherTongue:=NewLevel1]
mapped[NewDimension2=="MotherTongue",MotherTongue:=NewLevel2]
mapped[NewDimension3=="MotherTongue",MotherTongue:=NewLevel3]
mapped[NewDimension4=="MotherTongue",MotherTongue:=NewLevel4]

mapped[NewDimension1=="OuterWallType",OuterWallType:=NewLevel1]
mapped[NewDimension2=="OuterWallType",OuterWallType:=NewLevel2]
mapped[NewDimension3=="OuterWallType",OuterWallType:=NewLevel3]
mapped[NewDimension4=="OuterWallType",OuterWallType:=NewLevel4]

mapped[NewDimension1=="OwnershipType",OwnershipType:=NewLevel1]
mapped[NewDimension2=="OwnershipType",OwnershipType:=NewLevel2]
mapped[NewDimension3=="OwnershipType",OwnershipType:=NewLevel3]
mapped[NewDimension4=="OwnershipType",OwnershipType:=NewLevel4]

mapped[NewDimension1=="PregnancyStatus",PregnancyStatus:=NewLevel1]
mapped[NewDimension2=="PregnancyStatus",PregnancyStatus:=NewLevel2]
mapped[NewDimension3=="PregnancyStatus",PregnancyStatus:=NewLevel3]
mapped[NewDimension4=="PregnancyStatus",PregnancyStatus:=NewLevel4]

mapped[NewDimension1=="Priority",Priority:=NewLevel1]
mapped[NewDimension2=="Priority",Priority:=NewLevel2]
mapped[NewDimension3=="Priority",Priority:=NewLevel3]
mapped[NewDimension4=="Priority",Priority:=NewLevel4]

mapped[NewDimension1=="Religion",Religion:=NewLevel1]
mapped[NewDimension2=="Religion",Religion:=NewLevel2]
mapped[NewDimension3=="Religion",Religion:=NewLevel3]
mapped[NewDimension4=="Religion",Religion:=NewLevel4]

mapped[NewDimension1=="RoadType",RoadType:=NewLevel1]
mapped[NewDimension2=="RoadType",RoadType:=NewLevel2]
mapped[NewDimension3=="RoadType",RoadType:=NewLevel3]
mapped[NewDimension4=="RoadType",RoadType:=NewLevel4]

mapped[NewDimension1=="RoofType",RoofType:=NewLevel1]
mapped[NewDimension2=="RoofType",RoofType:=NewLevel2]
mapped[NewDimension3=="RoofType",RoofType:=NewLevel3]
mapped[NewDimension4=="RoofType",RoofType:=NewLevel4]

mapped[NewDimension1=="Sex",Sex:=NewLevel1]
mapped[NewDimension2=="Sex",Sex:=NewLevel2]
mapped[NewDimension3=="Sex",Sex:=NewLevel3]
mapped[NewDimension4=="Sex",Sex:=NewLevel4]

mapped[NewDimension1=="SourceOfDrinkingWater",SourceOfDrinkingWater:=NewLevel1]
mapped[NewDimension2=="SourceOfDrinkingWater",SourceOfDrinkingWater:=NewLevel2]
mapped[NewDimension3=="SourceOfDrinkingWater",SourceOfDrinkingWater:=NewLevel3]
mapped[NewDimension4=="SourceOfDrinkingWater",SourceOfDrinkingWater:=NewLevel4]

mapped[NewDimension1=="SourceOfLighting",SourceOfLighting:=NewLevel1]
mapped[NewDimension2=="SourceOfLighting",SourceOfLighting:=NewLevel2]
mapped[NewDimension3=="SourceOfLighting",SourceOfLighting:=NewLevel3]
mapped[NewDimension4=="SourceOfLighting",SourceOfLighting:=NewLevel4]

mapped[NewDimension1=="TypeOfFuel",TypeOfFuel:=NewLevel1]
mapped[NewDimension2=="TypeOfFuel",TypeOfFuel:=NewLevel2]
mapped[NewDimension3=="TypeOfFuel",TypeOfFuel:=NewLevel3]
mapped[NewDimension4=="TypeOfFuel",TypeOfFuel:=NewLevel4]

mapped[NewDimension1=="YearsPreceedingSurvey",YearsPreceedingSurvey:=NewLevel1]
mapped[NewDimension2=="YearsPreceedingSurvey",YearsPreceedingSurvey:=NewLevel2]
mapped[NewDimension3=="YearsPreceedingSurvey",YearsPreceedingSurvey:=NewLevel3]
mapped[NewDimension4=="YearsPreceedingSurvey",YearsPreceedingSurvey:=NewLevel4]


write.table(mapped, 
            file = "MappedDevInfoDimensions-Nepal-2.txt", 
            append = FALSE,
            quote = FALSE, 
            sep = "\t",
            eol = "\n", 
            na = "", 
            dec = ".", 
            row.names = FALSE,
            col.names = TRUE, 
            fileEncoding = "UTF-8")

#==============================================



library(tidyr)

key.mapped <- tibble::rowid_to_column(unique(mapped[, -c("OBS_VALUE","PUBLISHER","IC_NAME")]))


columns <- names(mapped)[!(names(mapped) %in% c("OBS_VALUE", "PUBLISHER", "IC_NAME" ))]

mapped2 <- merge( key.mapped, mapped, by = columns, all = TRUE)
mapped2[, repetition := frank(.I), by = list(rowid)]
#merged2[repetition>1,]
#test.dupl <- merged2[rowid == 4466,]



# dat %>% 
#   gather(temp, score, starts_with("Score")) %>% 
#   unite(temp1, Time, temp, sep = ".") %>% 
#   spread(temp1, score)

TEST <- mapped2 %>% 
           gather(key, value, c(OBS_VALUE,  IC_NAME))

TEST2 <- TEST %>%
           unite(temp1, TIME_PERIOD, key, sep = ".")

TEST3 <- TEST2[,! names(TEST2) %in% c( "TIME_PERIOD", "PUBLISHER", "IC_NAME", "rowid")] %>%
           spread(temp1, value)





write.table(TEST3, 
            file = "MappedDevInfoDimensions-Nepal-2 - pivot.txt", 
            append = FALSE,
            quote = FALSE, 
            sep = "\t",
            eol = "\n", 
            na = "", 
            dec = ".", 
            row.names = FALSE,
            col.names = TRUE, 
            fileEncoding = "UTF-8")

