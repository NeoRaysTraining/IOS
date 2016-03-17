// write a program print middle space  hdiamond//
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  //declare   variables
  int i, j, n;
  
  //initializing the value of n to 4
    n = 4;
    //Loop for printing upper half part of the pattern
    for(i=1; i<=n; i++)
    {
	//loop for printing the * according to n val
        for(j=i; j<=n; j++)
        {
            printf("*");
        }
		//loop for printing the space according to i val
        for(j=1; j<i; j++)
        {
            printf(" ");
        }
		//loop for printing the space according to i val
        for(j=1; j<i; j++)
        {
            printf(" ");
        }
		//loop for printing the * according to n val
        for(j=i; j<=n; j++)
        {
            printf("*");
        }
		//prints new line
        printf("\n");
    }
    //Loop for printing lower half part of the pattern
    for(i=2; i<=n; i++)
    {
	//loop for printing the * according to i val
        for(j=1; j<=i; j++)
        {
            printf("*");
        }
		//loop for printing the space according to n val
        for(j=i; j<n; j++)
        {
            printf(" ");
        }
		//loop for printing the space according to n val
        for(j=i; j<n; j++)
        {
            printf(" ");
        }
		//loop for printing the * according to i val
        for(j=1; j<=i; j++)
        {
            printf("*");
        }
		//prints new line
        printf("\n");
    }
    
   [pool drain];
   //returns 0 to main method
   return 0;
}
Output:
********
***  ***
**   **
*    *
**   **
***  ***
********
