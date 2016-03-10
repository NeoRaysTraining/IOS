/*Objective C Program to print the number pattern:        1
														 123
														12345
														 123
														  1
*/

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

//declaring the variables i, j, k

     int i, j, k;

//for loop to increment the rows

	 for(i=1;i<=3;i++)
    {
	//for loop to print the blank space " "     
	 
	 for(j=i;j<3;j++)
        {
        printf(" ");
        }
     //for loop to print the *  
	
		for(k=1;k<(i*2);k++)
        {
        printf("%d", k);
        }
        printf("\n");
    }
	
	//for loop to decrement the value of i
     
	 for(i=2;i>=1;i--)
     {
	
	//for loop to print the blank space " " 
    
		for(j=3;j>i;j--)
        {
        printf(" ");
        }
	
	//for loop to print the value of k
	
        for(k=1;k<(i*2);k++)
        {
         printf("%d", k);
        }
        printf("\n");
     }

   [pool drain];
   return 0;
}

