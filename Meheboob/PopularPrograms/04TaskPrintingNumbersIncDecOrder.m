/*Objective C Program to print pattern 

1
123
123456
123456789
12345
123
1
*/


#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  //defining the variables
    int i,j,rows;
    
 //initializing the variable row to 10
    rows = 10;
    
 //initializing the var i to 1 checking whether its less than rows
    for(i = 1; i<= rows; i=i+2)
    {
    for(j=1;j<= i; ++j)
    {
    if(i == 5)
    {
    i++;
    }
    if(i == 8)
    {
    i++;
    }
 //Prints the  value of j variable	
    printf("%d",j);
    }
 //Prints new line	
    printf("\n");
    
    }
    
     
  
     if(i == 11)
    {
     //defining the variables
    int ii,jj,rowss;
    
 //initializing the variable rowss to 6
    rowss = 6;
    
 //initializing the var ii to 6 checking whether its greathe than or equal to rowss
    for(ii = 6; ii>= rowss; ii=ii-2)
    {
    for(jj=1;jj<= ii; ++jj)
    {
    
    //Prints the val of jj variable
    printf("%d",jj);
    }
	//Prints new Line
    printf("\n");
    
    }
    if(ii == 4)
    {
     //defining the variables
    int iii,jjj,rowsss;
    
 //initializing the variable rowsss to 3
    rowsss = 3;
    
 //initializing the var iii to 3 checking whether its greather than or equal to  rowsss
    for(iii = 3; iii>= rowsss; iii=iii-2)
    {
    for(jjj=1;jjj<= iii; ++jjj)
    {
    
    //prints the val of jjj variable
    printf("%d",jjj);
    }
	//Prints new line
    printf("\n");
	//Prints the number 1
    printf("1");
	//Prints new line
    printf("\n");
    }
    }
   }
    
   
    [pool drain];
 //Returns 0 to main method
   return 0;
   }