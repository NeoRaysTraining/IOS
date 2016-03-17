/*Objective C Program to print pattern 

*
***
******
*********
******
***
*

*/

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  //defining the variables
    int i,j,rows;
    
 //initializing the variable rows to 9
    rows = 9;
    
 //initializing the var i to 0 checking whether its less than rows
    for(i = 0; i<= rows; i=i+2)
    {
 //loop for printing *
    for(j=0;j<= i; ++j)
    {
 //Checks whether variable i is equal to 4
 //if it equls then it increment by 1 
    if(i == 4)
    {
    i++;
    }
 //Checks whether variable i is equal to 7
 //if it equls then it increment by 1 
    if(i == 7)
    {
    i++;
    }
	//Prints  * with one space
    printf("* ");
    }
    printf("\n");
    
    }
      
   //Checks whether variable i is equal to 10
   //if equals then continue the execution
     if(i == 10)
    {
     //defining the variables
    int ii,jj,rowss;
    
 //initializing the variable row to 6
    rowss = 6;
    
 //initializing the var ii to 6 checking whether its 
 //greather than or equal to rowss
    for(ii = 6; ii>= rowss; ii=ii-2)
    {
    for(jj=1;jj<= ii; ++jj)
    {
    
    //Prints  * with one space 
    printf("* ");
    }
	//Prints new line
    printf("\n");
    
    }
    if(ii == 4)
    {
     //defining the variables
    int iii,jjj,rowsss;
    
 //initializing the variable row to 10
    rowsss = 3;
    
 //initializing the var iii to 3 checking whether its greather than or equal to rowsss
    for(iii = 3; iii>= rowsss; iii=iii-2)
    {
    for(jjj=1;jjj<= iii; ++jjj)
    {
    
  //Prints  * with one space
    printf("* ");
    }
 //Prints new line
    printf("\n");
  //Prints  * 
    printf("*");
    printf("\n");
    }
    }
   }
    
   
    [pool drain];
 //returns 0 to main method	
   return 0;
   }