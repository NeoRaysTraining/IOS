/*Objective C Program to print pattern 

   *
  ***
 *****
  ***
   *  
*/


#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  //Defining the local variables
  int i, j, n;
  
  //Initializing the local variable n to 3
    n = 3;
 //Prints the upper triangle	
	
	//lopping for 3 times to print rows
    for(i=1; i<=n; i++)
    {
	//Prints spaces according to n val
        for(j=i; j<n; j++)
        {
            printf(" ");
        }
		//Prints * according to i val
        for(j=1; j<=i; j++)
        {
            printf("*");
        }
        for(j=1; j<i; j++)
        {
		//Prints * according to i val
            printf("*");
        }
        printf("\n");
    }
    //Prints the lower triangle
	
	//loop for printing the number of rows
    for(i=n; i>=1; i--)
    {
	//Prints spaces according to n value
        for(j=i; j<=n; j++)
        {
            printf(" ");
        }
		//Prints * according to i value
        for(j=1; j<i; j++)
        {
            printf("*");
        }
        for(j=1; j<i-1; j++)
        {
            printf("*");
        }
        printf("\n");
    }
    
   [pool drain];
   //returns 0 to main method
   return 0;
}
