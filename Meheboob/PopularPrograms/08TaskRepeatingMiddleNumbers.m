/*Objective C Program to print pattern 
 
     1
    1 1
   1 2 1
  1 3 3 1  
 1 4 6 4 1
1 5 10 10 5 1 
*/
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   //defining local variables r,i,k,j & 
   //initialize local variable number to 1
    int r, i, k, number=1, j;
	
		
	//initializing the local variable r to 6 
	//indicates number of rows to display
		r = 6;
	//looping for 6 rows
		for(i=0;i<r;i++)
		{
		//loop for printing spaces between numbers
			for(k=r; k>i; k--)
			{
		//prints spaces
			printf(" ");
			}
	   //assignes value 1 to variable number		
            number = 1;
			
		//loop for printing	the numbers
			for(j=0;j<=i;j++)
			{
			//prints number 1
				 printf("%d",number);
			//prints space	 
				 printf(" ");
			//expression for printing numbers	 
                 number = number * (i - j) / (j + 1);
			}
			//prints new line
			printf("\n");
		}
   [pool drain];
   
   //returns 0 to main method
   return 0;
}
