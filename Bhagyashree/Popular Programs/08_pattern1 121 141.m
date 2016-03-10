/*Objective C Program to print the number pattern:         1                                                                                                                                                                                                       
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

/*declaring local variables r,i,k,j & initializing local variable number to 1*/
	
    int r, i, k, number=1, j;
	
	//initializing the local variable r to 6 indicates number of rows to display
		
		r = 6;
		
	//looping for 6 rows
		
		for(i=0;i<r;i++)
		{
		//loop for printing blank spaces " " between numbers
			
			for(k=r; k>i; k--)
			{
			printf(" ");
			}
            number = 1;
			for(j=0;j<=i;j++)
			{
				 printf("%d",number);
				 printf(" ");
                 number = number * (i - j) / (j + 1);
			}
			printf("\n");
		}
   [pool drain];
   return 0;
}
