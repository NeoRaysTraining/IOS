/*Objective C Program to print the star pattern :    *******
													 *** ***
													 **   **
													 *     *
													 **   **
													 *** ***
													 *******
*/

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
 //declaring the variables
 
  int i, j, n;

//intializing the the variale n
  
    n = 4;

//Loop for printing upper half part of the pattern

    for(i=1; i<=n; i++)
    {
		//for loop to print *
		
		for(j=i; j<=n; j++)
        {
            printf("*");
        
		}
		//for loop to print blank space " "
        for(j=1; j<i; j++)
        {
            printf(" ");
        }
		//for loop to print blank space " "
		
        for(j=1; j<i; j++)
        {
            printf(" ");
        }
		//for loop to print *
		
        for(j=i; j<=n; j++)
        {
            printf("*");
        }
        printf("\n");
    }
    //Loop for printing lower half of the pattern
    
	for(i=2; i<=n; i++)
    {
		//for loop to print *
		
		for(j=1; j<=i; j++)
        {
            printf("*");
        }
		//for loop to print blank space " "
        
		for(j=i; j<n; j++)
        {
            printf(" ");
        }
		//for loop to print blank space " "
        for(j=i; j<n; j++)
        {
            printf(" ");
        }
        //for loop to print *
		for(j=1; j<=i; j++)
        {
            printf("*");
        }
        printf("\n");
    }
    
   [pool drain];
   return 0;
}

