/*Program to print the star pattern as shown:        *
													***
												   *****
												    ***
													 *			
*/

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   
//declaring the variables
   
    int i, j, k;

//for loop to increment the rows
    
	for(i=1;i<=3;i++)
    {
        //for loop to print the blank space
		
		for(j=i;j<3;j++)
        {
        printf(" ");
        }
		
		//for loop to print the *
		
        for(k=1;k<(i*2);k++)
        {
        printf("*");
        }
        printf("\n");
    }
	
	//for loop to print the *
	for(i=2;i>=1;i--)
	{
		//for loop to print blank space
		for(j=3;j>i;j--)
        {
        printf(" ");
        }
		
		//for loop to print blank space
		
        for(k=1;k<(i*2);k++)
        {
         printf("*");
        }
        printf("\n");
     }

   
   [pool drain];
   return 0;
}

