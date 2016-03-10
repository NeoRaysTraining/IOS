/*program to print the pattren of empty rhomobous
the output of the program is given below
**********                                                                                                                                                                                            
****  ****                                                                                                                                                                                            
***    ***                                                                                                                                                                                            
**      **                                                                                                                                                                                            
*        *                                                                                                                                                                                            
**      **                                                                                                                                                                                            
***    ***                                                                                                                                                                                            
****  ****   
   
*/
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    NSLog (@"hello world");
	//declaring the variables    
	int i, j, k;
    //declaring the for loop i to print rows
    for(i=1;i<=5;i++)
    {
        //declaring the for loop for j to print *
        for(j=1;j<=6-i;j++)
        {
            //prints the * for each j loop
            printf("*");
        }
        //declaring the for loop for k second set of table
        for(k=1;k<i;k++)
        {
            //prints the empty spaces
            printf("  ");
        }
        //declaring the 2nd for loop for j to print secod set *
        for(j=1;j<=6-i;j++)
        {
            //prints second * from j
            printf("*");
        }
        //moves tonext line
        printf("\n");
    }
    //declaring the for loop for i
    for(i=2;i<=5;i++)
    {
		//declaring for loop to print j value
		for(j=1;j<=i;j++)
        {
			//prints * for each iteration of j
            printf("*");
        }
		//Declaring for loop for k to print spaces 
        for(k=1;k<=5-i;k++)
        {
			//prints the spaces for each iteration of k
            printf("  ");
        }
        for(j=1;j<=i;j++)
        {
            printf("*");
        }
        printf("\n");
    }
    [pool drain];
    return 0;
}
