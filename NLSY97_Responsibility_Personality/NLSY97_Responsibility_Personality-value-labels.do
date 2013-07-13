label define vlR0000100   0 "0"
label values R0000100 vlR0000100
label define vlR0536300   1 "Male"  2 "Female"  0 "No Information"
label values R0536300 vlR0536300
label define vlR0536401   1 "1: January"  2 "2: February"  3 "3: March"  4 "4: April"  5 "5: May"  6 "6: June"  7 "7: July"  8 "8: August"  9 "9: September"  10 "10: October"  11 "11: November"  12 "12: December"
label values R0536401 vlR0536401
label define vlR1235800   1 "Cross-sectional"  0 "Oversample"
label values R1235800 vlR1235800
label define vlR1482600   1 "Black"  2 "Hispanic"  3 "Mixed Race (Non-Hispanic)"  4 "Non-Black / Non-Hispanic"
label values R1482600 vlR1482600
label define vlS0920000   0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"
label values S0920000 vlS0920000
label define vlS0920100   0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"
label values S0920100 vlS0920100
label define vlS0920200   0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"
label values S0920200 vlS0920200
label define vlS0920300   0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"
label values S0920300 vlS0920300
label define vlS0920400   0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"
label values S0920400 vlS0920400
label define vlS0920500   0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"
label values S0920500 vlS0920500
label define vlS0920600   0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"
label values S0920600 vlS0920600
label define vlS0920700   0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"
label values S0920700 vlS0920700
label define vlS8646900   1 "Definitely should be"  2 "Probably should be"  3 "Probably should not be"  4 "Definitely should not be"
label values S8646900 vlS8646900
label define vlS8647000   1 "Definitely should be"  2 "Probably should be"  3 "Probably should not be"  4 "Definitely should not be"
label values S8647000 vlS8647000
label define vlS8647100   1 "Definitely should be"  2 "Probably should be"  3 "Probably should not be"  4 "Definitely should not be"
label values S8647100 vlS8647100
label define vlS8647200   1 "Definitely should be"  2 "Probably should be"  3 "Probably should not be"  4 "Definitely should not be"
label values S8647200 vlS8647200
label define vlS8647300   1 "Definitely should be"  2 "Probably should be"  3 "Probably should not be"  4 "Definitely should not be"
label values S8647300 vlS8647300
label define vlS8647400   1 "Definitely should be"  2 "Probably should be"  3 "Probably should not be"  4 "Definitely should not be"
label values S8647400 vlS8647400
label define vlS8647500   1 "Definitely should be"  2 "Probably should be"  3 "Probably should not be"  4 "Definitely should not be"
label values S8647500 vlS8647500
label define vlS8647600   1 "Definitely should be"  2 "Probably should be"  3 "Probably should not be"  4 "Definitely should not be"
label values S8647600 vlS8647600
label define vlS8647700   1 "Definitely should be"  2 "Probably should be"  3 "Probably should not be"  4 "Definitely should not be"
label values S8647700 vlS8647700
label define vlS8647800   1 "Definitely should be"  2 "Probably should be"  3 "Probably should not be"  4 "Definitely should not be"
label values S8647800 vlS8647800
label define vlT1068600   1 "Very important"  2 "Somewhat important"  3 "Not very important"  4 "Not important at all"
label values T1068600 vlT1068600
label define vlT1068700   1 "Very important"  2 "Somewhat important"  3 "Not very important"  4 "Not important at all"
label values T1068700 vlT1068700
label define vlT1068800   1 "Very well"  2 "Somewhat well"  3 "Somewhat poorly"  4 "Very poorly"
label values T1068800 vlT1068800
label define vlT1069100   4 "Strongly Agree"  3 "Agree"  2 "Neither Agree nor Disagree"  1 "Disagree"  0 "Strongly Disagree"
label values T1069100 vlT1069100
label define vlT1069101   4 "Strongly Agree"  3 "Agree"  2 "Neither Agree nor Disagree"  1 "Disagree"  0 "Strongly Disagree"
label values T1069101 vlT1069101
label define vlT1069102   4 "Strongly Agree"  3 "Agree"  2 "Neither Agree nor Disagree"  1 "Disagree"  0 "Strongly Disagree"
label values T1069102 vlT1069102
label define vlT1069103   4 "Strongly Agree"  3 "Agree"  2 "Neither Agree nor Disagree"  1 "Disagree"  0 "Strongly Disagree"
label values T1069103 vlT1069103
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME statement to rename variables for ease of use.
 * This command does not guarentee uniqueness
 */
  /* *start* */
/*
  rename R0000100 PUBID // PUBID
  rename R0536300 KEY!SEX // KEY!SEX
  rename R0536401 KEY!BDATE_M // KEY!BDATE_M
  rename R0536402 KEY!BDATE_Y // KEY!BDATE_Y
  rename R1235800 CV_SAMPLE_TYPE // CV_SAMPLE_TYPE
  rename R1482600 KEY!RACE_ETHNICITY // KEY!RACE_ETHNICITY
  rename S0920000 YSAQ_282J // YSAQ-282J
  rename S0920100 YSAQ_282K // YSAQ-282K
  rename S0920200 YSAQ_282L // YSAQ-282L
  rename S0920300 YSAQ_282M // YSAQ-282M
  rename S0920400 YSAQ_282N // YSAQ-282N
  rename S0920500 YSAQ_2820 // YSAQ-2820
  rename S0920600 YSAQ_282P // YSAQ-282P
  rename S0920700 YSAQ_282Q // YSAQ-282Q
  rename S8646900 YTEL_11A // YTEL-11A
  rename S8647000 YTEL_11B // YTEL-11B
  rename S8647100 YTEL_11C // YTEL-11C
  rename S8647200 YTEL_11D // YTEL-11D
  rename S8647300 YTEL_11E // YTEL-11E
  rename S8647400 YTEL_11F // YTEL-11F
  rename S8647500 YTEL_11G // YTEL-11G
  rename S8647600 YTEL_11H // YTEL-11H
  rename S8647700 YTEL_11I // YTEL-11I
  rename S8647800 YTEL_11J // YTEL-11J
  rename T1068600 YTEL_41 // YTEL-41
  rename T1068700 YTEL_42 // YTEL-42
  rename T1068800 YTEL_43 // YTEL-43
  rename T1069100 YTEL_52_000001 // YTEL-52~000001
  rename T1069101 YTEL_52_000002 // YTEL-52~000002
  rename T1069102 YTEL_52_000003 // YTEL-52~000003
  rename T1069103 YTEL_52_000004 // YTEL-52~000004
*/
  /* *end* */  
/* To convert variable names to lower case use the TOLOWER command 
 *      (type findit tolower and follow the links to install).
 * TOLOWER VARLIST will change listed variables to lower case; 
 *  TOLOWER without a specified variable list will convert all variables in the dataset to lower case
 */
/* tolower */
