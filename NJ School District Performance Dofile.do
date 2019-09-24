*______________________________________________________________________________*

// Data Formats and Conversion Problem Set #1// (STARTS LINE 10)
// Manipulating Data Problem Set #2 // (STARTS LINE 98)
// Richard Connelly, Fall 2019 //
// Data Management//
// Professor: Dr. Adam Okulicz-Kozaryn//

*______________________________________________________________________________*

clear // clears any prior data that could have already been loaded into Stata //
set matsize 800 // Sets maximum number of variables in model to 800 //   
vers 15 //Sets the software version to Stata 14 //
set more off // tells Stata to not pause and show -more message- // 
cap log close // Allows the .dofile to continue despite possible error messages //

*______________________________________________________________________________*

mkdir "C:\Users\uiser\Desktop/Stata_data/" //Creates a working directory to a public computer CHANGE BEFORE EXECUTING DOFILE // 

cd "C:\Users\uiser\Desktop/Stata_data/" // Sets the working directory to aforementioned pathway CHANGE BEFORE EXECUTING DOFILE// 

log using log1, replace // Opens log //

*______________________________________________________________________________*

use "https://github.com/RickConnelly/Data-Management/blob/master/NJSchoolDistrictPerformanceELA_Math_Clean.dta?raw=true", clear // This pulls data on NJ School District Student Performance from the NJ DOE. More specifically this data is about student performance in English Language Arts/Literacy (ELA) and Mathematics as measured by the Partnership for Assessment of Readiness for College and Careers assessment, also known as the PARCC test. The data displays PARCC results overall, by grade or test, and by school year. //

replace LALValidScores="." if LALValidScores=="*"
replace LALValidScores="." if LALValidScores==".999"
replace LALParticipationPercent="." if LALParticipationPercent=="*"
replace LALParticipationPercent="." if LALParticipationPercent==".999"  
replace LALDistrictPerformance="." if LALDistrictPerformance=="*"
replace LALDistrictPerformance="." if LALDistrictPerformance==".999"  
replace LALStatePerformance="." if LALStatePerformance=="*"
replace LALStatePerformance="." if LALStatePerformance==".999"  
replace LALProfRateFederalAccountability="." if LALProfRateFederalAccountability=="*"
replace LALProfRateFederalAccountability="." if LALProfRateFederalAccountability==".999"  
replace LALAnnualTarget="." if LALAnnualTarget=="**" 
replace LALAnnualTarget="." if LALAnnualTarget==".999" 
replace LALMetTarget="." if LALMetTarget=="**" 
replace LALMetTarget="." if LALMetTarget==".999" 
replace MATHValidScores="." if MATHValidScores=="*"
replace MATHValidScores="." if MATHValidScores==".999" 
replace MATHParticipationPercent="." if MATHParticipationPercent=="*"
replace MATHParticipationPercent="." if MATHParticipationPercent==".999"  
replace MATHDistrictPerformance="." if MATHDistrictPerformance=="*" 
replace MATHDistrictPerformance="." if MATHDistrictPerformance==".999" 
replace MATHStatePerformance="." if MATHStatePerformance=="*"
replace MATHStatePerformance="." if MATHStatePerformance==".999"  
replace MATHProfRateFederalAccountabilit="." if MATHProfRateFederalAccountabilit=="*"
replace MATHProfRateFederalAccountabilit="." if MATHProfRateFederalAccountabilit==".999"  
replace MATHAnnualTarget="." if MATHAnnualTarget=="**"
replace MATHAnnualTarget="." if MATHAnnualTarget==".999"  
replace MATHMetTarget="." if MATHMetTarget=="**"
replace MATHMetTarget="." if MATHMetTarget==".999"  

// ^^^Since I don't know more elegant code to clean the data, I mannually cleaned each varialbe that had missing values in the form of "*" , "**" , and ".999" **ASK HOW TO SIMPLIFY //

// "*" == that data was available for too few students to report the given information, or the data represents a small percentage of students. There may be some additional cases where the data was kept private because the data could be used to potentially identify individual students. //

// "**" ==  data was not available for the minimum 20 students, the required number for a student group to be included in New Jersey’s Every Student Succeeds Act ESS accountability system. //

// ".999" == indicates that no data was available to report. This happens when there are no students enrolled in a particular student group or if no data was submitted by the district. //

*______________________________________________________________________________*

destring * , replace // Destrings Varibles //

save Education_Data, replace // Saves the data under one name //

*______________________________________________________________________________*

// The following commands show basic descriptive statistics //

sum LALDistrictPerformance,d // This statstic shows that on average at the **District Level** 56.9% of students met or exceeded expectations in their performance on ELA assessments. Students in the upper quartile met or exceeded expectations at 71.9% while the lower quartile shows that 41.2% met or exceeded expectations with a SD of about 20.5%. The data is very slightly skewed to the left. // 

sum LALStatePerformance,d // This statistic shows that on average at the **State Level** 52.7% of students met or exceeded expectations in their performance on ELA assessments. This is a lower average of assessment expectations met or exceeded than when measuring at the district level by 4.2%. This trend continues in the upper quartile however at the state level a higer proportion of student met or exceeded assessment expectations at the lower quartile. //

sum MATHDistrictPerformance,d // On average at the district level 44.8% of students met or exceeded expectations on their performance on math assessments. At the upper and lower quartile students met or exceeded expectations at 30.7% and 61.1% respectively. The data is slightly skewed to the right. //

sum MATHStatePerformance, d // On average 43.9% of students met or exceed expectations on their performance on math assessments at the state level. This is only slightly less than the average at the district level. Overall, at the upper quartile 50.5% of students met or exceeded expectations and in the lower quartile only 23.7% met or exceeded expectations. //

*______________________________________________________________________________*

export excel using Education_Data // Exports file into an Excel document //

export delimited using Education_Data // Exports file into delimited text //

outfile using Education_Data // Exports file into a debased file //

*______________________________________________________________________________*

log close // Closes Log //

*______________________________________________________________________________*

//////////////////////////
// **Beginning of PS2** //
//////////////////////////


set seed 123456789 // Sets randomness to a constant //
sample 50, count // takes a random sample of 50 observations //
d // gives a basic description of the sample //
save Education_Data, replace // Saves the data under one name //

use Education_Data, replace

// ^^^ I maybe don't want this //













































