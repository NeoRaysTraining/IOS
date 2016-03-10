/*/*Problem Defnition
program to print the diamond shape pattren 
the output of the program is given below
  1                                                                                                                                                                                                   
 123                                                                                                                                                                                                  
12345                                                                                                                                                                                                 
 123                                                                                                                                                                                                  
  1   
*/
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    NSLog (@"hello world");
//declaring and initialising the variables 
 int n=3, i, k, j=1;
    //assigning the values to j to n-1
	j=n-1;
	//declaring for loop for k for 1st row
    for (k = 1; k <= n; k++)
    {
		//declaring the for loop to print the spaces
		for (i = 1; i<= j; i++)
		//printing the spaces
        printf(" ");
		//decrimenting the value of j
        j--;
		//for loop to print 1st 3 rows
        for (i = 1; i <= 2*k-1; i++)
		//prints the stars in  3 rows
        printf("%d",i);
		//new line character
        printf("\n");
    }
	//initialising the value of j to 1
    j = 1;
	//declaring the for loop for after 3 rows
    for (k = 1; k <= n - 1; k++)
    {
		//declaringfor loop to print spaces in second half
        for (i = 1; i<=j; i++)
        //printing the spaces
		printf(" ");
        //incrementing the value of j
		j++;
		//declaring the for loop to print the values in 4 and 5th row
        for (i = 1 ; i <= 2*(n-k)-1; i++)
		//printing the i value i.
        printf("%d",i);
		//move to next line
        printf("\n");
    }
    [pool drain];
    return 0;
}
