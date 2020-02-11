Footnote 'Krystian Wojcicki, 101001444';
Data BloodData;
Input Bp Age Weight;
Cards;
	80 3 2.61
	90 4 2.67
	96 5 2.98
	102 6 3.98
	81 3 2.87
	96 4 3.41
	99 5 3.49
	110 6 4.03
	88 3 3.41
	90 4 2.81
	100 5 3.24
	102 6 3.75
	86 3 3.18
	93 4 3.13
	101 5 3.98
	103 6 4.55
	86 3 3.41
	91 4 3.35
	100 5 3.75
	105 6 3.83
	84 3 3.18
	91 4 3.52
	95 5 3.49
	104 6 3.81
	107 6 4.03
Run;

ods pdf file="a3-output.pdf";
ods graphics off;

Proc Reg;
	Model Bp=Age Weight;
	Model Bp=Age;
Run;


Data Drug;
Input dose X2 X3 potency;
	X1=log(dose);
	interact12=X1*X2;
	interact13=X1*X3;
Cards;
	0.2 0 0 2.0
	0.4 0 0 4.3
	0.8 0 0 6.5
	1.6 0 0 8.9
	0.2 1 0 1.8
	0.4 1 0 4.1
	0.8 1 0 4.9
	1.6 1 0 5.7
	0.2 0 1 1.3
	0.4 0 1 2.0
	0.8 0 1 2.8
	1.6 0 1 3.4
Run;
Proc Reg;
	Model potency=X1 X2 X3 interact12 interact13;
	Model potency=X1 X2 X3;
Run;

ods pdf close
