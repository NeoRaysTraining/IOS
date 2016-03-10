#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   NSLog (@"hello world");
   int a[3][3] = {{1,2,-1},{1,4,7},{2,5,8}},trans[3][3],m[3][3],b[3][3];
   //int ind[3][3] = {{1,0,0},{0,1,0},{0,0,1}};
   int i,j,sum=0;
    printf("The First Matrix is: \n");
   for (i = 0; i < 3; i++) 
   {
      for (j = 0; j < 3; j++) 
      {
        //printing the matrix
         printf(" %d ", a[i][j]);
      }
      printf("\n");
    }
    for(i=0;i<3;i++)
    for(j=0;j<3;j++)
    {
        trans[j][i] = a[i][j];
    }
    printf("the transpose matrix is\n");
    for(i=0; i<3; ++i)
    {
    for(j=0; j<3; ++j)
    {
        printf("%d ",trans[i][j]);
    }
         printf("\n");
    }
    for(i=0;i<3;i++)
    for(j=0;j<3;j++)
    {
        sum = sum+a[i][j]*a[i][j];
        m[i][j] = sum;
    }
    printf("\nThe multiplication of two matrix is\n");
  for(i=0;i<3;i++)
  {
      printf("\n");
      for(j=0;j<3;j++)
      {
          printf("%d\t",m[i][j]);
      }
  }
  for(i=0;i<3;i++)
    for(j=0;j<3;j++)
    {
        b[i][j] = m[i][j]-2*a[i][j];
    }
    printf("the matrix are");
    for(i=0;i<3;i++)
  {
      printf("\n");
      for(j=0;j<3;j++)
      {
          printf("%d\t",b[i][j]);
      }
  }
    
    
   [pool drain];
   return 0;
}
