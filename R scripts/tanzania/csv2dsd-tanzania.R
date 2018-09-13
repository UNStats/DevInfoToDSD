library(data.table)

setwd("C:/Users/L.GonzalezMorales/Documents/PROJ - DevInfoToDSD/tanzania")



#-----------------------------------------------------------------------------
# List of countreis to be plotted on a map (with XY coordinates)
#------------------------------------------- ----------------------------------

DevInfoRaw <- as.data.table(read.table("output/devinfo_output_tanzania.csv", 
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
            file = "EditDevInfoDimensions-Tanzania.txt", 
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

DevInfoTanzania.DimensionsMapping <- as.data.table(read.table("TanzaniaDevInfo-DimensionsMapping2.csv", 
                                       header = TRUE, 
                                       sep = ",",
                                       quote = "\"" ,
                                       na.strings = "", 
                                       stringsAsFactors = FALSE,
                                       encoding = "UTF-8"))


mapped <- merge(DevInfoRaw,
                DevInfoTanzania.DimensionsMapping,
                all = TRUE)


write.table(mapped, 
            file = "MappedDevInfoDimensions-Tanzania.txt", 
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
                              unique(mapped[,list(Dimension=NewDimension4,  Level=NewLevel4)]),
                              unique(mapped[,list(Dimension=NewDimension5,  Level=NewLevel5)])))


NewDimensions <- NewDimensions[order(Dimension,Level)]

NewDimensions <- na.omit(NewDimensions, cols="Dimension")

cat(paste(unique(NewDimensions[,Dimension]),  "\n", sep =""))

mapped[NewDimension1=="Activity", Activity:=NewLevel1]
mapped[NewDimension2=="Activity", Activity:=NewLevel2]
mapped[NewDimension3=="Activity", Activity:=NewLevel3]
mapped[NewDimension4=="Activity", Activity:=NewLevel4]
mapped[NewDimension5=="Activity", Activity:=NewLevel5]

mapped[NewDimension1=="Age", Age:=NewLevel1]
mapped[NewDimension2=="Age", Age:=NewLevel2]
mapped[NewDimension3=="Age", Age:=NewLevel3]
mapped[NewDimension4=="Age", Age:=NewLevel4]
mapped[NewDimension5=="Age", Age:=NewLevel5]

mapped[NewDimension1=="AgeOfMother", AgeOfMother:=NewLevel1]
mapped[NewDimension2=="AgeOfMother", AgeOfMother:=NewLevel2]
mapped[NewDimension3=="AgeOfMother", AgeOfMother:=NewLevel3]
mapped[NewDimension4=="AgeOfMother", AgeOfMother:=NewLevel4]
mapped[NewDimension5=="AgeOfMother", AgeOfMother:=NewLevel5]

mapped[NewDimension1=="CreativeIndustry", CreativeIndustry:=NewLevel1]
mapped[NewDimension2=="CreativeIndustry", CreativeIndustry:=NewLevel2]
mapped[NewDimension3=="CreativeIndustry", CreativeIndustry:=NewLevel3]
mapped[NewDimension4=="CreativeIndustry", CreativeIndustry:=NewLevel4]
mapped[NewDimension5=="CreativeIndustry", CreativeIndustry:=NewLevel5]

mapped[NewDimension1=="Crop", Crop:=NewLevel1]
mapped[NewDimension2=="Crop", Crop:=NewLevel2]
mapped[NewDimension3=="Crop", Crop:=NewLevel3]
mapped[NewDimension4=="Crop", Crop:=NewLevel4]
mapped[NewDimension5=="Crop", Crop:=NewLevel5]

mapped[NewDimension1=="Education", Education:=NewLevel1]
mapped[NewDimension2=="Education", Education:=NewLevel2]
mapped[NewDimension3=="Education", Education:=NewLevel3]
mapped[NewDimension4=="Education", Education:=NewLevel4]
mapped[NewDimension5=="Education", Education:=NewLevel5]

mapped[NewDimension1=="EducationOfMother", EducationOfMother:=NewLevel1]
mapped[NewDimension2=="EducationOfMother", EducationOfMother:=NewLevel2]
mapped[NewDimension3=="EducationOfMother", EducationOfMother:=NewLevel3]
mapped[NewDimension4=="EducationOfMother", EducationOfMother:=NewLevel4]
mapped[NewDimension5=="EducationOfMother", EducationOfMother:=NewLevel5]

mapped[NewDimension1=="EducatonOfMogher", EducatonOfMogher:=NewLevel1]
mapped[NewDimension2=="EducatonOfMogher", EducatonOfMogher:=NewLevel2]
mapped[NewDimension3=="EducatonOfMogher", EducatonOfMogher:=NewLevel3]
mapped[NewDimension4=="EducatonOfMogher", EducatonOfMogher:=NewLevel4]
mapped[NewDimension5=="EducatonOfMogher", EducatonOfMogher:=NewLevel5]

mapped[NewDimension1=="EmploymentSize", EmploymentSize:=NewLevel1]
mapped[NewDimension2=="EmploymentSize", EmploymentSize:=NewLevel2]
mapped[NewDimension3=="EmploymentSize", EmploymentSize:=NewLevel3]
mapped[NewDimension4=="EmploymentSize", EmploymentSize:=NewLevel4]
mapped[NewDimension5=="EmploymentSize", EmploymentSize:=NewLevel5]

mapped[NewDimension1=="EstablishmentSize", EstablishmentSize:=NewLevel1]
mapped[NewDimension2=="EstablishmentSize", EstablishmentSize:=NewLevel2]
mapped[NewDimension3=="EstablishmentSize", EstablishmentSize:=NewLevel3]
mapped[NewDimension4=="EstablishmentSize", EstablishmentSize:=NewLevel4]
mapped[NewDimension5=="EstablishmentSize", EstablishmentSize:=NewLevel5]

mapped[NewDimension1=="FamilyPlanning", FamilyPlanning:=NewLevel1]
mapped[NewDimension2=="FamilyPlanning", FamilyPlanning:=NewLevel2]
mapped[NewDimension3=="FamilyPlanning", FamilyPlanning:=NewLevel3]
mapped[NewDimension4=="FamilyPlanning", FamilyPlanning:=NewLevel4]
mapped[NewDimension5=="FamilyPlanning", FamilyPlanning:=NewLevel5]

mapped[NewDimension1=="Industry", Industry:=NewLevel1]
mapped[NewDimension2=="Industry", Industry:=NewLevel2]
mapped[NewDimension3=="Industry", Industry:=NewLevel3]
mapped[NewDimension4=="Industry", Industry:=NewLevel4]
mapped[NewDimension5=="Industry", Industry:=NewLevel5]

mapped[NewDimension1=="Location", Location:=NewLevel1]
mapped[NewDimension2=="Location", Location:=NewLevel2]
mapped[NewDimension3=="Location", Location:=NewLevel3]
mapped[NewDimension4=="Location", Location:=NewLevel4]
mapped[NewDimension5=="Location", Location:=NewLevel5]

mapped[NewDimension1=="Media", Media:=NewLevel1]
mapped[NewDimension2=="Media", Media:=NewLevel2]
mapped[NewDimension3=="Media", Media:=NewLevel3]
mapped[NewDimension4=="Media", Media:=NewLevel4]
mapped[NewDimension5=="Media", Media:=NewLevel5]

mapped[NewDimension1=="Occupation", Occupation:=NewLevel1]
mapped[NewDimension2=="Occupation", Occupation:=NewLevel2]
mapped[NewDimension3=="Occupation", Occupation:=NewLevel3]
mapped[NewDimension4=="Occupation", Occupation:=NewLevel4]
mapped[NewDimension5=="Occupation", Occupation:=NewLevel5]

mapped[NewDimension1=="Origin", Origin:=NewLevel1]
mapped[NewDimension2=="Origin", Origin:=NewLevel2]
mapped[NewDimension3=="Origin", Origin:=NewLevel3]
mapped[NewDimension4=="Origin", Origin:=NewLevel4]
mapped[NewDimension5=="Origin", Origin:=NewLevel5]

mapped[NewDimension1=="Other", Other:=NewLevel1]
mapped[NewDimension2=="Other", Other:=NewLevel2]
mapped[NewDimension3=="Other", Other:=NewLevel3]
mapped[NewDimension4=="Other", Other:=NewLevel4]
mapped[NewDimension5=="Other", Other:=NewLevel5]

mapped[NewDimension1=="Ownership", Ownership:=NewLevel1]
mapped[NewDimension2=="Ownership", Ownership:=NewLevel2]
mapped[NewDimension3=="Ownership", Ownership:=NewLevel3]
mapped[NewDimension4=="Ownership", Ownership:=NewLevel4]
mapped[NewDimension5=="Ownership", Ownership:=NewLevel5]

mapped[NewDimension1=="PovertyLevel", PovertyLevel:=NewLevel1]
mapped[NewDimension2=="PovertyLevel", PovertyLevel:=NewLevel2]
mapped[NewDimension3=="PovertyLevel", PovertyLevel:=NewLevel3]
mapped[NewDimension4=="PovertyLevel", PovertyLevel:=NewLevel4]
mapped[NewDimension5=="PovertyLevel", PovertyLevel:=NewLevel5]

mapped[NewDimension1=="Product", Product:=NewLevel1]
mapped[NewDimension2=="Product", Product:=NewLevel2]
mapped[NewDimension3=="Product", Product:=NewLevel3]
mapped[NewDimension4=="Product", Product:=NewLevel4]
mapped[NewDimension5=="Product", Product:=NewLevel5]

mapped[NewDimension1=="ProductCategory", ProductCategory:=NewLevel1]
mapped[NewDimension2=="ProductCategory", ProductCategory:=NewLevel2]
mapped[NewDimension3=="ProductCategory", ProductCategory:=NewLevel3]
mapped[NewDimension4=="ProductCategory", ProductCategory:=NewLevel4]
mapped[NewDimension5=="ProductCategory", ProductCategory:=NewLevel5]

mapped[NewDimension1=="RailwayNetwork", RailwayNetwork:=NewLevel1]
mapped[NewDimension2=="RailwayNetwork", RailwayNetwork:=NewLevel2]
mapped[NewDimension3=="RailwayNetwork", RailwayNetwork:=NewLevel3]
mapped[NewDimension4=="RailwayNetwork", RailwayNetwork:=NewLevel4]
mapped[NewDimension5=="RailwayNetwork", RailwayNetwork:=NewLevel5]

mapped[NewDimension1=="ReasonsForInactivity", ReasonsForInactivity:=NewLevel1]
mapped[NewDimension2=="ReasonsForInactivity", ReasonsForInactivity:=NewLevel2]
mapped[NewDimension3=="ReasonsForInactivity", ReasonsForInactivity:=NewLevel3]
mapped[NewDimension4=="ReasonsForInactivity", ReasonsForInactivity:=NewLevel4]
mapped[NewDimension5=="ReasonsForInactivity", ReasonsForInactivity:=NewLevel5]

mapped[NewDimension1=="RoadCondition", RoadCondition:=NewLevel1]
mapped[NewDimension2=="RoadCondition", RoadCondition:=NewLevel2]
mapped[NewDimension3=="RoadCondition", RoadCondition:=NewLevel3]
mapped[NewDimension4=="RoadCondition", RoadCondition:=NewLevel4]
mapped[NewDimension5=="RoadCondition", RoadCondition:=NewLevel5]

mapped[NewDimension1=="RoadType", RoadType:=NewLevel1]
mapped[NewDimension2=="RoadType", RoadType:=NewLevel2]
mapped[NewDimension3=="RoadType", RoadType:=NewLevel3]
mapped[NewDimension4=="RoadType", RoadType:=NewLevel4]
mapped[NewDimension5=="RoadType", RoadType:=NewLevel5]

mapped[NewDimension1=="Season", Season:=NewLevel1]
mapped[NewDimension2=="Season", Season:=NewLevel2]
mapped[NewDimension3=="Season", Season:=NewLevel3]
mapped[NewDimension4=="Season", Season:=NewLevel4]
mapped[NewDimension5=="Season", Season:=NewLevel5]

mapped[NewDimension1=="Sector", Sector:=NewLevel1]
mapped[NewDimension2=="Sector", Sector:=NewLevel2]
mapped[NewDimension3=="Sector", Sector:=NewLevel3]
mapped[NewDimension4=="Sector", Sector:=NewLevel4]
mapped[NewDimension5=="Sector", Sector:=NewLevel5]

mapped[NewDimension1=="Sex", Sex:=NewLevel1]
mapped[NewDimension2=="Sex", Sex:=NewLevel2]
mapped[NewDimension3=="Sex", Sex:=NewLevel3]
mapped[NewDimension4=="Sex", Sex:=NewLevel4]
mapped[NewDimension5=="Sex", Sex:=NewLevel5]

mapped[NewDimension1=="TurnoverSource", TurnoverSource:=NewLevel1]
mapped[NewDimension2=="TurnoverSource", TurnoverSource:=NewLevel2]
mapped[NewDimension3=="TurnoverSource", TurnoverSource:=NewLevel3]
mapped[NewDimension4=="TurnoverSource", TurnoverSource:=NewLevel4]
mapped[NewDimension5=="TurnoverSource", TurnoverSource:=NewLevel5]

mapped[NewDimension1=="TypeOfDrinkingWaterSource", TypeOfDrinkingWaterSource:=NewLevel1]
mapped[NewDimension2=="TypeOfDrinkingWaterSource", TypeOfDrinkingWaterSource:=NewLevel2]
mapped[NewDimension3=="TypeOfDrinkingWaterSource", TypeOfDrinkingWaterSource:=NewLevel3]
mapped[NewDimension4=="TypeOfDrinkingWaterSource", TypeOfDrinkingWaterSource:=NewLevel4]
mapped[NewDimension5=="TypeOfDrinkingWaterSource", TypeOfDrinkingWaterSource:=NewLevel5]

mapped[NewDimension1=="TypeOfEmployment", TypeOfEmployment:=NewLevel1]
mapped[NewDimension2=="TypeOfEmployment", TypeOfEmployment:=NewLevel2]
mapped[NewDimension3=="TypeOfEmployment", TypeOfEmployment:=NewLevel3]
mapped[NewDimension4=="TypeOfEmployment", TypeOfEmployment:=NewLevel4]
mapped[NewDimension5=="TypeOfEmployment", TypeOfEmployment:=NewLevel5]

mapped[NewDimension1=="TypeOfEmplyment", TypeOfEmployment:=NewLevel1]
mapped[NewDimension2=="TypeOfEmplyment", TypeOfEmployment:=NewLevel2]
mapped[NewDimension3=="TypeOfEmplyment", TypeOfEmployment:=NewLevel3]
mapped[NewDimension4=="TypeOfEmplyment", TypeOfEmployment:=NewLevel4]
mapped[NewDimension5=="TypeOfEmplyment", TypeOfEmployment:=NewLevel5]

mapped[NewDimension1=="TypeOfHealthFacility", TypeOfHealthFacility:=NewLevel1]
mapped[NewDimension2=="TypeOfHealthFacility", TypeOfHealthFacility:=NewLevel2]
mapped[NewDimension3=="TypeOfHealthFacility", TypeOfHealthFacility:=NewLevel3]
mapped[NewDimension4=="TypeOfHealthFacility", TypeOfHealthFacility:=NewLevel4]
mapped[NewDimension5=="TypeOfHealthFacility", TypeOfHealthFacility:=NewLevel5]

mapped[NewDimension1=="TypeOfRefuseDisposal", TypeOfRefuseDisposal:=NewLevel1]
mapped[NewDimension2=="TypeOfRefuseDisposal", TypeOfRefuseDisposal:=NewLevel2]
mapped[NewDimension3=="TypeOfRefuseDisposal", TypeOfRefuseDisposal:=NewLevel3]
mapped[NewDimension4=="TypeOfRefuseDisposal", TypeOfRefuseDisposal:=NewLevel4]
mapped[NewDimension5=="TypeOfRefuseDisposal", TypeOfRefuseDisposal:=NewLevel5]

mapped[NewDimension1=="TypeOfSource", TypeOfSource:=NewLevel1]
mapped[NewDimension2=="TypeOfSource", TypeOfSource:=NewLevel2]
mapped[NewDimension3=="TypeOfSource", TypeOfSource:=NewLevel3]
mapped[NewDimension4=="TypeOfSource", TypeOfSource:=NewLevel4]
mapped[NewDimension5=="TypeOfSource", TypeOfSource:=NewLevel5]

mapped[NewDimension1=="TypeOfTaxes", TypeOfTaxes:=NewLevel1]
mapped[NewDimension2=="TypeOfTaxes", TypeOfTaxes:=NewLevel2]
mapped[NewDimension3=="TypeOfTaxes", TypeOfTaxes:=NewLevel3]
mapped[NewDimension4=="TypeOfTaxes", TypeOfTaxes:=NewLevel4]
mapped[NewDimension5=="TypeOfTaxes", TypeOfTaxes:=NewLevel5]

mapped[NewDimension1=="TypeOfToiletFacilities", TypeOfToiletFacilities:=NewLevel1]
mapped[NewDimension2=="TypeOfToiletFacilities", TypeOfToiletFacilities:=NewLevel2]
mapped[NewDimension3=="TypeOfToiletFacilities", TypeOfToiletFacilities:=NewLevel3]
mapped[NewDimension4=="TypeOfToiletFacilities", TypeOfToiletFacilities:=NewLevel4]
mapped[NewDimension5=="TypeOfToiletFacilities", TypeOfToiletFacilities:=NewLevel5]

mapped[NewDimension1=="Wealth quintile", WealthQuintile:=NewLevel1]
mapped[NewDimension2=="Wealth quintile", WealthQuintile:=NewLevel2]
mapped[NewDimension3=="Wealth quintile", WealthQuintile:=NewLevel3]
mapped[NewDimension4=="Wealth quintile", WealthQuintile:=NewLevel4]
mapped[NewDimension5=="Wealth quintile", WealthQuintile:=NewLevel5]

mapped[NewDimension1=="WealthQuintile", WealthQuintile:=NewLevel1]
mapped[NewDimension2=="WealthQuintile", WealthQuintile:=NewLevel2]
mapped[NewDimension3=="WealthQuintile", WealthQuintile:=NewLevel3]
mapped[NewDimension4=="WealthQuintile", WealthQuintile:=NewLevel4]
mapped[NewDimension5=="WealthQuintile", WealthQuintile:=NewLevel5]



write.table(mapped, 
            file = "MappedDevInfoDimensions-Tanzania-2.txt", 
            append = FALSE,
            quote = FALSE, 
            sep = "\t",
            eol = "\n", 
            na = "", 
            dec = ".", 
            row.names = FALSE,
            col.names = TRUE, 
            fileEncoding = "UTF-8")


#===========================================================

library(tidyr)

# Select unique key dimensions
key.mapped <- tibble::rowid_to_column(unique(mapped[, -c("OBS_VALUE","PUBLISHER","IC_NAME")]))

columns <- names(mapped)[!(names(mapped) %in% c("OBS_VALUE", "PUBLISHER", "IC_NAME" ))]

mapped2 <- merge( key.mapped, mapped, by = columns, all = TRUE)
mapped2[, repetition := frank(.I), by = list(rowid)]
#mapped2[repetition>1,]
#test.dupl <- mapped2[rowid == 4299,]



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
            file = "MappedDevInfoDimensions-Tanzania-2 - pivot.txt", 
            append = FALSE,
            quote = FALSE, 
            sep = "\t",
            eol = "\n", 
            na = "", 
            dec = ".", 
            row.names = FALSE,
            col.names = TRUE, 
            fileEncoding = "UTF-8")
