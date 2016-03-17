//write a program for to print number in 1,123123456,123456789,123456,123,1 in
// in sequential order 

#import <Foundation/Foundation.h>
// main method execution starts
int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  //declaring  the variables
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
 //Prints j variable val	
    printf("%d",j);
    }
 //Prints new line	
    printf("\n");
    
    }
    if(i == 11)
    {
     //declaring  the variables
    int ii,jj,secondrows;
    
 //initializing the variable rowss to 6
   secondrows  = 6;
    
 //initializing the var ii to 6 checking whether its greathe than or equal to rowss
    for(ii = 6; ii>= secondrows; ii=ii-2)
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
    int iii,jjj,thirdrows;
    
 //initializing the variable rowsss to 3
    thirdrows = 3;
    
 //initializing the var iii to 3 checking whether its greather than or equal to  rowsss
    for(iii = 3; iii>= thirdrows; iii=iii-2)
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
 
   return 0;
   }
   
   Output:
   1
   123
   123456
   123456789
   123456
   123
   1