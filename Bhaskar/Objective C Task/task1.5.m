#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   int i, j;
    for(i=1;i<=5;i++)
    {
        for(j=1;j<=2*i-1;j++)
        {
            printf("%d",j);
        }
        printf("\n");
    }
    for(i=4;i>=1;i--)
    {
        for(j=2*i-1;j>=1;j--)
        {
            printf("%d",j);
        }
        printf("\n");
    }
    
   [pool drain];
   return 0;
}
