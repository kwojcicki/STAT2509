footnote 'Krystian Wojcicki, 101001444'; 

Data Run_Time;
Input treadmill_time tenkm_time @@;
Cards;
  7.5 43.5 7.8 45.2 7.9 44.9 8.1 41.1 8.3 43.8 8.7 44.4 8.9 38.7 9.2 43.1 9.4 41.8
  9.8 43.7 10.1 39.5 10.3 38.2 10.5 43.9 10.7 37.1 10.8 37.7 10.9 39.2 11.2 35.7 11.5 37.2
  11.7 34.8 11.8 38.5
Run;

ods pdf file="example1-output.pdf";
ods graphics off;

Proc reg;
  Model tenkm_time=treadmill_time;
  Plot tenkm_time*treadmill_time;
Run;

Data Predict;
  Input treadmill_time tenkm_time;
  Cards;
    9.5 .
Run;
Data Combine;
	Set Run_Time Predict;
Run;
Proc Reg;
  Model tenkm_time=treadmill_time/CLM CLI;
Run;

Proc reg;
  Model tenkm_time=treadmill_time;
  Plot R.*P.;
  Plot R.*treadmill_time;
  Output out=res R=resids;
Run;
Proc Chart;
  vbar resids;
Run;

ods pdf close
