file handle pcdat/name='NLSY97_Responsibility_Personality.dat' /lrecl=99.
data list file pcdat free /
  R0000100 (F4)
  R0536300 (F2)
  R0536401 (F2)
  R0536402 (F4)
  R1235800 (F2)
  R1482600 (F2)
  S0920000 (F2)
  S0920100 (F2)
  S0920200 (F2)
  S0920300 (F2)
  S0920400 (F2)
  S0920500 (F2)
  S0920600 (F2)
  S0920700 (F2)
  S8646900 (F2)
  S8647000 (F2)
  S8647100 (F2)
  S8647200 (F2)
  S8647300 (F2)
  S8647400 (F2)
  S8647500 (F2)
  S8647600 (F2)
  S8647700 (F2)
  S8647800 (F2)
  T1068600 (F2)
  T1068700 (F2)
  T1068800 (F2)
  T1069100 (F2)
  T1069101 (F2)
  T1069102 (F2)
  T1069103 (F2)
.
* The following code works with current versions of SPSS.
missing values all (-5 thru -1).
* older versions of SPSS may require this:
* recode all (-5,-3,-2,-1=-4).
* missing values all (-4).
variable labels
  R0000100  "PUBID - YTH ID CODE 1997"
  R0536300  "KEY!SEX (SYMBOL) 1997"
  R0536401  "KEY!BDATE M/Y (SYMBOL) 1997"
  R0536402  "KEY!BDATE M/Y (SYMBOL) 1997"
  R1235800  "CV_SAMPLE_TYPE 1997"
  R1482600  "KEY!RACE_ETHNICITY (SYMBOL) 1997"
  S0920000  "R IS DISORGANIZED OR ORGANIZED 2002"
  S0920100  "R IS CONSCIENTIOUS 2002"
  S0920200  "R IS UNDEPENDABLE OR DEPENDABLE 2002"
  S0920300  "R IS THOROUGH OR CARELESS 2002"
  S0920400  "R IS AGREEABLE OR QUARRELSOME 2002"
  S0920500  "R IS DIFFICULT OR COOPERATIVE 2002"
  S0920600  "R IS STUBBORN OR FLEXIBLE 2002"
  S0920700  "R IS TRUSTFUL OR DISTRUSTFUL 2002"
  S8646900  "GOVT RESPONSIBILITY - PROVIDE JOBS 2006"
  S8647000  "GOVT RESPNSBLTY - KEEP PRICES UND CTRL 2006"
  S8647100  "GOVT RESPNSBLTY - HLTH CARE FOR SICK 2006"
  S8647200  "GOVT RESPNSBLTY -PROV ELD LIV STAND 2006"
  S8647300  "GOVT RESPNSBLTY -PROV IND HELP 2006"
  S8647400  "GOVT RESPNSBLTY -PROV UNEMP LIV STAND 2006"
  S8647500  "GOVT RESPNSBLTY -REDUCE INC DIFF 2006"
  S8647600  "GOVT RESPNSBLTY -PROV COLL FIN AID 2006"
  S8647700  "GOVT RESPNSBLTY -PROV DECENT HOUSING 2006"
  S8647800  "GOVT RESPNSBLTY -PROTECT ENVIRONMENT 2006"
  T1068600  "IMP OF NLSY97 IN UNDRSTNDNG YNG AM LVS 2007"
  T1068700  "PERCP IMP NLSY97 TO OTH PEOPLE 2007"
  T1068800  "NLSY97 - CAPTURE INFO ABOUT RS LIFE 2007"
  T1069100  "PEOPLE NEED TO LOOK AFTER THEMSELVES 2007"
  T1069101  "PEOPLE SHOULD TAKE CARE OF THEMSELVES 2007"
  T1069102  "HELPING PEOPLE IS IMPORTANT TO R 2007"
  T1069103  "PEOPLE SHOULD HELP LESS FORTUNATE 2007"
.
* value labels
 R0000100
    0 "0"
    /
 R0536300
    1 "Male"
    2 "Female"
    0 "No Information"
    /
 R0536401
    1 "1: January"
    2 "2: February"
    3 "3: March"
    4 "4: April"
    5 "5: May"
    6 "6: June"
    7 "7: July"
    8 "8: August"
    9 "9: September"
    10 "10: October"
    11 "11: November"
    12 "12: December"
    /
 R1235800
    1 "Cross-sectional"
    0 "Oversample"
    /
 R1482600
    1 "Black"
    2 "Hispanic"
    3 "Mixed Race (Non-Hispanic)"
    4 "Non-Black / Non-Hispanic"
    /
 S0920000
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    /
 S0920100
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    /
 S0920200
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    /
 S0920300
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    /
 S0920400
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    /
 S0920500
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    /
 S0920600
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    /
 S0920700
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    /
 S8646900
    1 "Definitely should be"
    2 "Probably should be"
    3 "Probably should not be"
    4 "Definitely should not be"
    /
 S8647000
    1 "Definitely should be"
    2 "Probably should be"
    3 "Probably should not be"
    4 "Definitely should not be"
    /
 S8647100
    1 "Definitely should be"
    2 "Probably should be"
    3 "Probably should not be"
    4 "Definitely should not be"
    /
 S8647200
    1 "Definitely should be"
    2 "Probably should be"
    3 "Probably should not be"
    4 "Definitely should not be"
    /
 S8647300
    1 "Definitely should be"
    2 "Probably should be"
    3 "Probably should not be"
    4 "Definitely should not be"
    /
 S8647400
    1 "Definitely should be"
    2 "Probably should be"
    3 "Probably should not be"
    4 "Definitely should not be"
    /
 S8647500
    1 "Definitely should be"
    2 "Probably should be"
    3 "Probably should not be"
    4 "Definitely should not be"
    /
 S8647600
    1 "Definitely should be"
    2 "Probably should be"
    3 "Probably should not be"
    4 "Definitely should not be"
    /
 S8647700
    1 "Definitely should be"
    2 "Probably should be"
    3 "Probably should not be"
    4 "Definitely should not be"
    /
 S8647800
    1 "Definitely should be"
    2 "Probably should be"
    3 "Probably should not be"
    4 "Definitely should not be"
    /
 T1068600
    1 "Very important"
    2 "Somewhat important"
    3 "Not very important"
    4 "Not important at all"
    /
 T1068700
    1 "Very important"
    2 "Somewhat important"
    3 "Not very important"
    4 "Not important at all"
    /
 T1068800
    1 "Very well"
    2 "Somewhat well"
    3 "Somewhat poorly"
    4 "Very poorly"
    /
 T1069100
    4 "Strongly Agree"
    3 "Agree"
    2 "Neither Agree nor Disagree"
    1 "Disagree"
    0 "Strongly Disagree"
    /
 T1069101
    4 "Strongly Agree"
    3 "Agree"
    2 "Neither Agree nor Disagree"
    1 "Disagree"
    0 "Strongly Disagree"
    /
 T1069102
    4 "Strongly Agree"
    3 "Agree"
    2 "Neither Agree nor Disagree"
    1 "Disagree"
    0 "Strongly Disagree"
    /
 T1069103
    4 "Strongly Agree"
    3 "Agree"
    2 "Neither Agree nor Disagree"
    1 "Disagree"
    0 "Strongly Disagree"
    /
.
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME VARIABLES statement to rename variables for ease of use.
 * This command does not guarentee uniqueness
 */  /* *start* */

COMMENT RENAME VARIABLES
    (R0000100 = PUBID_1997)
    (R0536300 = KEY!SEX_1997)
    (R0536401 = KEY!BDATE_M_1997)
    (R0536402 = KEY!BDATE_Y_1997)
    (R1235800 = CV_SAMPLE_TYPE_1997)
    (R1482600 = KEY!RACE_ETHNICITY_1997)
    (S0920000 = YSAQ-282J_2002)
    (S0920100 = YSAQ-282K_2002)
    (S0920200 = YSAQ-282L_2002)
    (S0920300 = YSAQ-282M_2002)
    (S0920400 = YSAQ-282N_2002)
    (S0920500 = YSAQ-2820_2002)
    (S0920600 = YSAQ-282P_2002)
    (S0920700 = YSAQ-282Q_2002)
    (S8646900 = YTEL-11A_2006)
    (S8647000 = YTEL-11B_2006)
    (S8647100 = YTEL-11C_2006)
    (S8647200 = YTEL-11D_2006)
    (S8647300 = YTEL-11E_2006)
    (S8647400 = YTEL-11F_2006)
    (S8647500 = YTEL-11G_2006)
    (S8647600 = YTEL-11H_2006)
    (S8647700 = YTEL-11I_2006)
    (S8647800 = YTEL-11J_2006)
    (T1068600 = YTEL-41_2007)
    (T1068700 = YTEL-42_2007)
    (T1068800 = YTEL-43_2007)
    (T1069100 = YTEL-52~000001_2007)
    (T1069101 = YTEL-52~000002_2007)
    (T1069102 = YTEL-52~000003_2007)
    (T1069103 = YTEL-52~000004_2007)
.
  /* *end* */

descriptives all.