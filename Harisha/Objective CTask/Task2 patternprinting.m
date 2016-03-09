
/*Problem Defnition
program program has to folloeing pattren
*                                                                                                                                                                                                     
***                                                                                                                                                                                                   
*****                                                                                                                                                                                                 
*******                                                                                                                                                                                               
*********                                                                                                                                                                                             
*****                                                                                                                                                                                                 
***                                                                                                                                                                                                   
*   
 */
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    NSLog (@"hello world");
    
    //declaring the variables 
    int i, j;
    
    //declaring for loop for i to print 9 columns
    for(i=1;i<=9;i+=2)
    {
        //declaring for loop for j to print the values
        for(j=1;j<=i;j++)
        printf("*");
         printf("\n");
    }
    //declaring 2nd for loop for i
    for(i=5;i>=1;i-=2)
    {
        //declaring 2nd for loop for j
        for(j=1;j<=i;j++)
        printf("*");
        printf("\n");
    }
    [pool drain];
    return 0;
}
