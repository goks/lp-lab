%{
#include<stdio.h>
int count=0;
%}
 
%%
"int" | "float" | "double" | "char" {
  char ch;
  ch=input();
 
  while(1) {
    if(ch==',') 
      count++;

    if(ch==';') {
      count++;
      break;
    }

    if(ch=='\n')
      break;
   
    ch=input();
  }
}
. | '\n' ;
%%
 
int main(int argc,char *argv[])
{
    if(argc!=2)
    printf("\n\nINVALID INPUT\n\n");
    else {
        yyin=fopen(argv[1],"r");
        if(yyin) 
        {
            yylex();
            printf("\nNo of identifiers = %d\n",count);
        }
        else
            printf("\nError in opening the file\n");
    }
    printf("\n");
}
 
int yywrap()
{
    return 1;
}
