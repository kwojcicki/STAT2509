Footnote 'Krystian Wojcicki, 101001444';
data battery;
input group$ pressure @@;
cards;
	low 8.0 low 8.1 low 9.2 low 9.4 low 11.7
	normal 7.6 normal 8.2 normal 9.8 normal 10.9 normal 12.3
	high 6.0 high 6.3 high 7.1 high 7.7 high 8.9
	very_high 5.1 very_high 5.6 very_high 5.9 very_high 6.7 very_high 7.8
run;

ods pdf file="a4-output.pdf";
ods graphics off;

proc anova;
	class group;
	model pressure=group;
	means group/tukey cldiff alpha=0.10;
run;
proc NPAR1WAY WILCOXON;
	class group;
run;


data chemicals;
input chemical rat_number irritation @@;
cards;
	1 1 6 1 2 9 1 3 6 1 4 5 1 5 7 1 6 5 1 7 6 1 8 6
	2 1 5 2 2 9 2 3 9 2 4 8 2 5 8 2 6 7 2 7 7 2 8 7
	3 1 3 3 2 4 3 3 3 3 4 6 3 5 8 3 6 5 3 7 5 3 8 6
run;
proc anova;
	class rat_number chemical;
	model irritation=rat_number chemical;
	means chemical/tukey cldiff alpha=0.05;
run;
proc freq;
	tables rat_number*chemical*irritation/CMH2 SCORES=RANK NOPRINT;
run;

ods pdf close
