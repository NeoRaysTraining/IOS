/*problem definition

program to dipslay following pattern

******                                                                                                                                                                                                         
**  **                                                                                                                                                                                                         
*    *                                                                                                                                                                                                         
**  **                                                                                                                                                                                                         
******  
*/

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   
    //declaring required variables
   int i, j, k;
   
   //initialing and iterating i from 1 to 3
    for(i=1;i<=3;i++)
    {
        //initialing and iterating j to print *
        for(j=1;j<=4-i;j++)
        {
            printf("*");
        }
        
        //iterating k from 1 to i to print spaces
        for(k=1;k<i;k++)
        {
            printf("  ");
        }
        
        //initialing and iterating j to print *
        for(j=1;j<=4-i;j++)
        {
            printf("*");
        }
        printf("\n");
        
    }
    //iterating i from 2 to 3 to desing lower part of pattern
    for(i=2;i<=3;i++)
    {
        //initialing and iterating j to print *
        for(j=1;j<=i;j++)
        {
            printf("*");
        }
        
        //iterating k from 1 to i to print spaces
        for(k=1;k<=3-i;k++)
        {
            printf("  ");
        }
        
        //initialing and iterating j to print *
        for(j=1;j<=i;j++)
        {
            printf("*");
        }
        printf("\n");
  }
   [pool drain];
   
   //returns 0 to main
   return 0;
}
