/*Objective C Program to print the pattern:      *                                                                                                                                                                                                             
												 * * *                                                                                                                                                                                                         
												 * * * * * *                                                                                                                                                                                                   
												 * * * * * * * * *                                                                                                                                                                                             
												 * * * * * *                                                                                                                                                                                                   
												 * * *                                                                                                                                                                                                         
												 * 
*/

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  //declaring the variables
    
	int i,j,rows;
    
 //initializing the variable rows to 9
    
	rows = 9;
    
 //for loop to increment the row number and initializing the var i to 0
    
	for(i = 0; i<= rows; i=i+2)
    {
    //for loop to print *
	for(j=0;j<= i; ++j)
    {
    //increment 'i' if it is equal to 4
	
	if(i == 4)
    {
    i++;
    }
	//increment 'i' if it is equal to 7
    
	if(i == 7)
    {
    i++;
    }
	
	//Prints  * with one space
    printf("* ");
    }
    printf("\n");
    
    }
   
    if(i == 10)
    {
 //declaring the variables
    int p,q,rowss;
    
 //initializing the variable row to 6
    
	rowss = 6;
    
 //initializing the var p to 6 checking whether it is greather than or equal to rowss
    
	for(p = 6; p>= rowss; p=p-2)
    {
    for(q=1;q<= p; ++q)
    {
    
    //Prints  * with one space 
    printf("* ");
    }
	//Prints new line
    printf("\n");
    
    }
    if(p == 4)
    {
     //defining the variables
    int m,n,rowsss;
    
 //initializing the variable row to 10
    rowsss = 3;
    
 //initializing the var iii to 3 checking whether its greather than or equal to rowsss
    for(m = 3; m>= rowsss; m=m-2)
    {
    for(n=1;n<= m; ++n)
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