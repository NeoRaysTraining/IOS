// write a program to print diamond in rhombus 
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  //declaring  the  variables
  int i, j, n;
  
  //Initializing  n to 3
    n = 3;
 	
	
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
        //print next value //
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

Output:
 
  *
 ***
*****
 ***
  *