﻿* Encoding: UTF-8.
Assignment 1
  
  REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING PAIRWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA COLLIN TOL CHANGE ZPP SELECTION
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT pain
  /METHOD=ENTER SEX_dummy age
  /METHOD=ENTER STAI_trait pain_cat cortisol_saliva mindfulness
  /CASEWISE PLOT(ZRESID) OUTLIERS(3).

Assignment 2

FREQUENCIES VARIABLES=weight
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN MEDIAN MODE SUM SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=ANALYSIS.

Initial model

REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING PAIRWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA COLLIN TOL CHANGE ZPP SELECTION
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT pain
  /METHOD=BACKWARD age SEX_dummy STAI_trait pain_cat cortisol_serum mindfulness weight.

Backward model

REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING PAIRWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA COLLIN TOL CHANGE ZPP SELECTION
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT pain
  /METHOD=ENTER age SEX_dummy pain_cat cortisol_serum mindfulness.

Theory-based model
  
  REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING PAIRWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA COLLIN TOL CHANGE ZPP SELECTION
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT pain
  /METHOD=ENTER age SEX_dummy pain_cat mindfulness cortisol_saliva STAI_trait.

Testing theory-based model on dataset 2 

DATASET ACTIVATE DataSet2.
REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING PAIRWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA COLLIN TOL CHANGE ZPP SELECTION
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT pain
  /METHOD=ENTER age Sex_dummy STAI_trait pain_cat mindfulness cortisol_saliva.

Testing the backwards model on dataset 2

REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING PAIRWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA COLLIN TOL CHANGE ZPP SELECTION
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT pain
  /METHOD=ENTER age Sex_dummy pain_cat mindfulness cortisol_serum.

Assignment 3: 

Running the null model

MIXED pain
  /CRITERIA=CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, 
    ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)
  /FIXED=| SSTYPE(3)
  /METHOD=REML
  /PRINT=COVB G  SOLUTION TESTCOV
  /RANDOM=INTERCEPT | SUBJECT(HospitalRecoded) COVTYPE(VC).

Running the level 1 model

MIXED pain BY sex WITH age STAI_trait pain_cat mindfulness cortisol_saliva
  /CRITERIA=CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, 
    ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)
  /FIXED=sex age STAI_trait pain_cat mindfulness cortisol_saliva | SSTYPE(3)
  /METHOD=REML
  /PRINT=COVB G  SOLUTION TESTCOV
  /RANDOM=INTERCEPT | SUBJECT(HospitalRecoded) COVTYPE(VC).

Running the level 2 model: 

With only random intercepts:


DATASET ACTIVATE DataSet3.
MIXED pain BY sex_dummy WITH age STAI_trait pain_cat cortisol_saliva mindfulness
  /CRITERIA=CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, 
    ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)
  /FIXED=sex_dummy age STAI_trait pain_cat cortisol_saliva mindfulness | SSTYPE(3)
  /METHOD=REML
  /PRINT=G  SOLUTION TESTCOV
  /RANDOM=INTERCEPT | SUBJECT(hospital) COVTYPE(VC).

Level 2 random intercept model

MIXED pain BY sex_dummy WITH age STAI_trait pain_cat cortisol_saliva mindfulness
  /CRITERIA=CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, 
    ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)
  /FIXED=sex_dummy age STAI_trait pain_cat cortisol_saliva mindfulness | SSTYPE(3)
  /METHOD=REML
  /PRINT=G  SOLUTION TESTCOV
  /RANDOM=INTERCEPT sex_dummy age STAI_trait pain_cat cortisol_saliva mindfulness | 
    SUBJECT(hospital) COVTYPE(UN).
