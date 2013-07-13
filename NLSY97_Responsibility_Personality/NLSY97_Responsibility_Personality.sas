options nocenter validvarname=any;

*---Read in space-delimited ascii file;

data new_data;


infile 'NLSY97_Responsibility_Personality.dat' lrecl=99 missover DSD DLM=' ' print;
input
  R0000100
  R0536300
  R0536401
  R0536402
  R1235800
  R1482600
  S0920000
  S0920100
  S0920200
  S0920300
  S0920400
  S0920500
  S0920600
  S0920700
  S8646900
  S8647000
  S8647100
  S8647200
  S8647300
  S8647400
  S8647500
  S8647600
  S8647700
  S8647800
  T1068600
  T1068700
  T1068800
  T1069100
  T1069101
  T1069102
  T1069103
;
array nvarlist _numeric_;


*---Recode missing values to SAS custom system missing. See SAS
      documentation for use of MISSING option in procedures, e.g. PROC FREQ;

do over nvarlist;
  if nvarlist = -1 then nvarlist = .R;  /* Refused */
  if nvarlist = -2 then nvarlist = .D;  /* Dont know */
  if nvarlist = -3 then nvarlist = .I;  /* Invalid missing */
  if nvarlist = -4 then nvarlist = .V;  /* Valid missing */
  if nvarlist = -5 then nvarlist = .N;  /* Non-interview */
end;

  label R0000100 = "PUBID - YTH ID CODE 1997";
  label R0536300 = "KEY!SEX (SYMBOL) 1997";
  label R0536401 = "KEY!BDATE M/Y (SYMBOL) 1997";
  label R0536402 = "KEY!BDATE M/Y (SYMBOL) 1997";
  label R1235800 = "CV_SAMPLE_TYPE 1997";
  label R1482600 = "KEY!RACE_ETHNICITY (SYMBOL) 1997";
  label S0920000 = "R IS DISORGANIZED OR ORGANIZED 2002";
  label S0920100 = "R IS CONSCIENTIOUS 2002";
  label S0920200 = "R IS UNDEPENDABLE OR DEPENDABLE 2002";
  label S0920300 = "R IS THOROUGH OR CARELESS 2002";
  label S0920400 = "R IS AGREEABLE OR QUARRELSOME 2002";
  label S0920500 = "R IS DIFFICULT OR COOPERATIVE 2002";
  label S0920600 = "R IS STUBBORN OR FLEXIBLE 2002";
  label S0920700 = "R IS TRUSTFUL OR DISTRUSTFUL 2002";
  label S8646900 = "GOVT RESPONSIBILITY - PROVIDE JOBS 2006";
  label S8647000 = "GOVT RESPNSBLTY - KEEP PRICES UND CTRL 2006";
  label S8647100 = "GOVT RESPNSBLTY - HLTH CARE FOR SICK 2006";
  label S8647200 = "GOVT RESPNSBLTY -PROV ELD LIV STAND 2006";
  label S8647300 = "GOVT RESPNSBLTY -PROV IND HELP 2006";
  label S8647400 = "GOVT RESPNSBLTY -PROV UNEMP LIV STAND 2006";
  label S8647500 = "GOVT RESPNSBLTY -REDUCE INC DIFF 2006";
  label S8647600 = "GOVT RESPNSBLTY -PROV COLL FIN AID 2006";
  label S8647700 = "GOVT RESPNSBLTY -PROV DECENT HOUSING 2006";
  label S8647800 = "GOVT RESPNSBLTY -PROTECT ENVIRONMENT 2006";
  label T1068600 = "IMP OF NLSY97 IN UNDRSTNDNG YNG AM LVS 2007";
  label T1068700 = "PERCP IMP NLSY97 TO OTH PEOPLE 2007";
  label T1068800 = "NLSY97 - CAPTURE INFO ABOUT RS LIFE 2007";
  label T1069100 = "PEOPLE NEED TO LOOK AFTER THEMSELVES 2007";
  label T1069101 = "PEOPLE SHOULD TAKE CARE OF THEMSELVES 2007";
  label T1069102 = "HELPING PEOPLE IS IMPORTANT TO R 2007";
  label T1069103 = "PEOPLE SHOULD HELP LESS FORTUNATE 2007";

/*---------------------------------------------------------------------*
 *  Crosswalk for Reference number & Question name                     *
 *---------------------------------------------------------------------*
 * Uncomment and edit this RENAME statement to rename variables
 * for ease of use.  You may need to use  name literal strings
 * e.g.  'variable-name'n   to create valid SAS variable names, or 
 * alter variables similarly named across years.
 * This command does not guarentee uniqueness

 * See SAS documentation for use of name literals and use of the
 * VALIDVARNAME=ANY option.     
 *---------------------------------------------------------------------*/
  /* *start* */

* RENAME
  R0000100 = 'PUBID_1997'n
  R0536300 = 'KEY!SEX_1997'n
  R0536401 = 'KEY!BDATE_M_1997'n
  R0536402 = 'KEY!BDATE_Y_1997'n
  R1235800 = 'CV_SAMPLE_TYPE_1997'n
  R1482600 = 'KEY!RACE_ETHNICITY_1997'n
  S0920000 = 'YSAQ-282J_2002'n
  S0920100 = 'YSAQ-282K_2002'n
  S0920200 = 'YSAQ-282L_2002'n
  S0920300 = 'YSAQ-282M_2002'n
  S0920400 = 'YSAQ-282N_2002'n
  S0920500 = 'YSAQ-2820_2002'n
  S0920600 = 'YSAQ-282P_2002'n
  S0920700 = 'YSAQ-282Q_2002'n
  S8646900 = 'YTEL-11A_2006'n
  S8647000 = 'YTEL-11B_2006'n
  S8647100 = 'YTEL-11C_2006'n
  S8647200 = 'YTEL-11D_2006'n
  S8647300 = 'YTEL-11E_2006'n
  S8647400 = 'YTEL-11F_2006'n
  S8647500 = 'YTEL-11G_2006'n
  S8647600 = 'YTEL-11H_2006'n
  S8647700 = 'YTEL-11I_2006'n
  S8647800 = 'YTEL-11J_2006'n
  T1068600 = 'YTEL-41_2007'n
  T1068700 = 'YTEL-42_2007'n
  T1068800 = 'YTEL-43_2007'n
  T1069100 = 'YTEL-52~000001_2007'n
  T1069101 = 'YTEL-52~000002_2007'n
  T1069102 = 'YTEL-52~000003_2007'n
  T1069103 = 'YTEL-52~000004_2007'n
;
  /* *finish* */

run;

proc means data=new_data n mean min max;
run;


/*---------------------------------------------------------------------*
 *  FORMATTED TABULATIONS                                              *
 *---------------------------------------------------------------------*
 * You can uncomment and edit the PROC FORMAT and PROC FREQ statements 
 * provided below to obtain formatted tabulations. The tabulations 
 * should reflect codebook values.
 * 
 * Please edit the formats below reflect any renaming of the variables
 * you may have done in the first data step. 
 *---------------------------------------------------------------------*/

/*
proc format; 
value vx0f
  0='0'
  1-999='1 TO 999'
  1000-1999='1000 TO 1999'
  2000-2999='2000 TO 2999'
  3000-3999='3000 TO 3999'
  4000-4999='4000 TO 4999'
  5000-5999='5000 TO 5999'
  6000-6999='6000 TO 6999'
  7000-7999='7000 TO 7999'
  8000-8999='8000 TO 8999'
  9000-9999='9000 TO 9999'
;
value vx1f
  1='Male'
  2='Female'
  0='No Information'
;
value vx2f
  1='1: January'
  2='2: February'
  3='3: March'
  4='4: April'
  5='5: May'
  6='6: June'
  7='7: July'
  8='8: August'
  9='9: September'
  10='10: October'
  11='11: November'
  12='12: December'
;
value vx4f
  1='Cross-sectional'
  0='Oversample'
;
value vx5f
  1='Black'
  2='Hispanic'
  3='Mixed Race (Non-Hispanic)'
  4='Non-Black / Non-Hispanic'
;
value vx6f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
;
value vx7f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
;
value vx8f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
;
value vx9f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
;
value vx10f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
;
value vx11f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
;
value vx12f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
;
value vx13f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
;
value vx14f
  1='Definitely should be'
  2='Probably should be'
  3='Probably should not be'
  4='Definitely should not be'
;
value vx15f
  1='Definitely should be'
  2='Probably should be'
  3='Probably should not be'
  4='Definitely should not be'
;
value vx16f
  1='Definitely should be'
  2='Probably should be'
  3='Probably should not be'
  4='Definitely should not be'
;
value vx17f
  1='Definitely should be'
  2='Probably should be'
  3='Probably should not be'
  4='Definitely should not be'
;
value vx18f
  1='Definitely should be'
  2='Probably should be'
  3='Probably should not be'
  4='Definitely should not be'
;
value vx19f
  1='Definitely should be'
  2='Probably should be'
  3='Probably should not be'
  4='Definitely should not be'
;
value vx20f
  1='Definitely should be'
  2='Probably should be'
  3='Probably should not be'
  4='Definitely should not be'
;
value vx21f
  1='Definitely should be'
  2='Probably should be'
  3='Probably should not be'
  4='Definitely should not be'
;
value vx22f
  1='Definitely should be'
  2='Probably should be'
  3='Probably should not be'
  4='Definitely should not be'
;
value vx23f
  1='Definitely should be'
  2='Probably should be'
  3='Probably should not be'
  4='Definitely should not be'
;
value vx24f
  1='Very important'
  2='Somewhat important'
  3='Not very important'
  4='Not important at all'
;
value vx25f
  1='Very important'
  2='Somewhat important'
  3='Not very important'
  4='Not important at all'
;
value vx26f
  1='Very well'
  2='Somewhat well'
  3='Somewhat poorly'
  4='Very poorly'
;
value vx27f
  4='Strongly Agree'
  3='Agree'
  2='Neither Agree nor Disagree'
  1='Disagree'
  0='Strongly Disagree'
;
value vx28f
  4='Strongly Agree'
  3='Agree'
  2='Neither Agree nor Disagree'
  1='Disagree'
  0='Strongly Disagree'
;
value vx29f
  4='Strongly Agree'
  3='Agree'
  2='Neither Agree nor Disagree'
  1='Disagree'
  0='Strongly Disagree'
;
value vx30f
  4='Strongly Agree'
  3='Agree'
  2='Neither Agree nor Disagree'
  1='Disagree'
  0='Strongly Disagree'
;
*/

/* 
 *--- Tabulations using reference number variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format R0000100 vx0f.;
  format R0536300 vx1f.;
  format R0536401 vx2f.;
  format R1235800 vx4f.;
  format R1482600 vx5f.;
  format S0920000 vx6f.;
  format S0920100 vx7f.;
  format S0920200 vx8f.;
  format S0920300 vx9f.;
  format S0920400 vx10f.;
  format S0920500 vx11f.;
  format S0920600 vx12f.;
  format S0920700 vx13f.;
  format S8646900 vx14f.;
  format S8647000 vx15f.;
  format S8647100 vx16f.;
  format S8647200 vx17f.;
  format S8647300 vx18f.;
  format S8647400 vx19f.;
  format S8647500 vx20f.;
  format S8647600 vx21f.;
  format S8647700 vx22f.;
  format S8647800 vx23f.;
  format T1068600 vx24f.;
  format T1068700 vx25f.;
  format T1068800 vx26f.;
  format T1069100 vx27f.;
  format T1069101 vx28f.;
  format T1069102 vx29f.;
  format T1069103 vx30f.;
run;
*/

/*
*--- Tabulations using default named variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format PUBID_1997 vx0f.;
  format KEY!SEX_1997 vx1f.;
  format KEY!BDATE_M_1997 vx2f.;
  format CV_SAMPLE_TYPE_1997 vx4f.;
  format KEY!RACE_ETHNICITY_1997 vx5f.;
  format YSAQ-282J_2002 vx6f.;
  format YSAQ-282K_2002 vx7f.;
  format YSAQ-282L_2002 vx8f.;
  format YSAQ-282M_2002 vx9f.;
  format YSAQ-282N_2002 vx10f.;
  format YSAQ-2820_2002 vx11f.;
  format YSAQ-282P_2002 vx12f.;
  format YSAQ-282Q_2002 vx13f.;
  format YTEL-11A_2006 vx14f.;
  format YTEL-11B_2006 vx15f.;
  format YTEL-11C_2006 vx16f.;
  format YTEL-11D_2006 vx17f.;
  format YTEL-11E_2006 vx18f.;
  format YTEL-11F_2006 vx19f.;
  format YTEL-11G_2006 vx20f.;
  format YTEL-11H_2006 vx21f.;
  format YTEL-11I_2006 vx22f.;
  format YTEL-11J_2006 vx23f.;
  format YTEL-41_2007 vx24f.;
  format YTEL-42_2007 vx25f.;
  format YTEL-43_2007 vx26f.;
  format YTEL-52~000001_2007 vx27f.;
  format YTEL-52~000002_2007 vx28f.;
  format YTEL-52~000003_2007 vx29f.;
  format YTEL-52~000004_2007 vx30f.;
run;
*/