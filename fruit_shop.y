%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
	#include<math.h>
	int yylex(void);
	void yyerror(const char *s);
	extern char *yytext;
	float calcPrice(float num);
	void calculate();
	char* fruit;
	float num;
	float ans = 0.0;
%}

%union {
	char* c;
	float d;
}

%token AMOUNT FRUIT QUE NEWLINE SPACE PRIZE FOR KG OF

%%
	START: sentense1 NEWLINE 			{	
											calculate();
											return 0;
										}
										
	sentense1: PRIZE SPACE FOR SPACE AMOUNT SPACE KG SPACE OF SPACE{
											num = yylval.d;
										}
				sentense2
	
	sentense2: 	FRUIT SPACE QUE{
											fruit = yylval.c;
										}

%%

void calculate() {
	ans = calcPrice(num);
	printf("%f\n",ans);
}


float calcPrice(float num) {
	
	if(strcmp(fruit, "APPLE")==0) {
		return num * 120;
	}
	else if(strcmp(fruit, "BANANA")==0) {
		return num * 15;
	}
	else if(strcmp(fruit, "CHERRY")==0) {
		return num * 50;
	}
	else if(strcmp(fruit, "MANGO")==0) {
		return num * 100;
	}
	else if(strcmp(fruit, "GRAPES")==0) {
		return num * 60;
	}
	else if(strcmp(fruit, "DATE")==0) {
		return num * 80; 
	}
	else if(strcmp(fruit, "TOMATOES")==0) {
		return num * 15;
	}
	else if(strcmp(fruit, "ONION")==0) {
		return num * 10;
	}
	else if(strcmp(fruit, "WATERMELON")==0) {
		return = num * 30;
	} 
	return 0;
}

int main() {
	yyparse();
    return 0;
}

void yyerror(const char *s){
    fprintf(stderr, "%s\n", s);
    return;
}