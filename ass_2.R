####Assesment 2
#install.packages('cgdsr')
library(cgdsr)

##Create CGDS object
mycgds = CGDS("http://www.cbioportal.org/")
test(mycgds)

mycancerstudy = "thca_tcga" #retrieved from the assignment

##Retrieve the cast_list_id of all tumors (chose for all tumors to be sure to exclude no data)
mycaselist = getCaseLists(mycgds,mycancerstudy)[2,1]

##Retrieve the genetic_profile_id of the Mutations data set
mygeneticprofile = getGeneticProfiles(mycgds,mycancerstudy)[8,1]

##Retrieve the mutations of BRAF from the thyroid TCGA data-set
genes <- "BRAF"

##Retrieve and plot the data
#First tried to plot data using plot.CGDS function from the cgdsr package, gave and error message. It could be caused by NA values.
#plot.CGDS(mycgds, mycancerstudy, genes, mygeneticprofile, mycaselist)
#decided to try a different approach

patient_braf<- getProfileData(mycgds,genes,mygeneticprofile,mycaselist)
#patient_braf <- patient_braf[!is.na(patient_braf$BRAF),]#Remove the NA results from the patient_braf data.frame. Not necessary for plotting
table(patient_braf)
plot(patient_braf)
