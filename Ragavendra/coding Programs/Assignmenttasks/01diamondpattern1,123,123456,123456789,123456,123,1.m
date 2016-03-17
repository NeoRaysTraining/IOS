//write a program for diamond pattern in the 1,123,123456,123456789,123456,123,1 in(*) pattern //

#import <Foundation/Foundation.h>

// main method starts execution 

int main(int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
//  declaring the variables
    int i,j,rows;
    
 //initializing the  rows to 9
    rows = 9;
    
 //declare and initializing the var i to 0 checking whether its less than rows
    for(i = 0; i<=rows; i=i+2)
    {
    for(j=0;j<=i; ++j)
    {
    if(i == 4)
    {
    i++;
    }
    if(i==7)
    {
    i++;
    }
	//Prints the * with one space
    printf(" * ");
    }
    printf("\n");
    
    }
      
   // printf("\n %d",i);
     if(i == 10)
    {
     //defining the variables
    int ii,jj,secondrows;
    
 //initializing the variable row to 6
    secondrows= 6;
    
 //initializing the var ii to 6 checking whether its 
 //greather than or equal to rowss
    for(ii = 6; ii>= secondrows; ii=ii-2)
    {
    for(jj=1;jj<= ii; ++jj)
    {
    
    //Prints  the * with one space 
    printf("* ");
    }
	//Prints next line
    printf("\n");
    
    }
    if(ii == 4)
    {
     //declaring the variables
    int iii,jjj,thirdrows;
    
 //initializing the variable row to 10
    thirdrows = 3;
    
 //initializing the var iii to 3 checking whether its greather than or equal to rowsss
    for(iii = 3; iii>= thirdrows; iii=iii-2)
    {
    for(jjj=1;jjj<= iii; ++jjj)
    {
    
  //Prints  * with one space
    printf(" * ");
    }
 //Prints new line
    printf("\n");
  
    printf("*");
    printf("\n");
    }
    }
   }
    
   
    [pool drain];
 //returns 0 to main method	
   return 0;
   }
   Output:
   *
   ***
   ******
   *********
   ******
   ***
   *
   