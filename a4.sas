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


ods pdf close
