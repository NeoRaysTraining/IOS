#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   int i, j,n=3,s=1;
   s=n-1;
    for(i=1;i<=n;i++)
    {
      
      for(j=n;j>i;j--)
        printf("  ");
      for(j=1;j<=i;j++)
          printf("%d ",j);
      for(j=j-2;j>=1;j--)
          printf("%d ",j);
      printf("\n");
    
    }
    s=1;
    for(i=n-1;i>=1;i--)
    {
      
      for(j=n;j>i;j--)
        printf("  ");
      for(j=1;j<=i;j++)
          printf("%d ",j);
      for(j=j-2;j>=1;j--)
          printf("%d ",j);
      printf("\n");
    } 
      
   [pool drain];
   return 0;
}
