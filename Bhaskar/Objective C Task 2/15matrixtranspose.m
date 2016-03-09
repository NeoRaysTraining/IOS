/*
matrix multiplication

A= 1 2 -1
   1 4 7
   2 5 8
   
   compute A transpose of a matrix
   A=A'
*/

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   [pool drain];
   //declaring array and initializing array
    int a[3][3]={{1,2,-1},{1,4,7},{2,5,8}};
    
    
    //declaring local variables for iteration
   int i,j;
   
   
   //printing given matrix 
   NSLog(@"The given matrix(3*3) is: ");
   // i forloop is used to iterate with rows
   for(i=0;i<3;i++)
   {
    //j forloop is used to iterate with cols
    for(j=0;j<3;j++)
    {
        printf("%d \t",a[i][j]);
    }
    printf("\n");
   }
   
   //printing transpose of a matirx
   NSLog(@"The transpose of a matrix(3*3) is: ");
   
   //using j for loop printing elements of column
   for(j=0;j<3;j++)
   {
    for(i=0;i<3;i++)
    {
        printf("%d \t",a[i][j]);
    }
    printf("\n");
   }
   return 0;
}
