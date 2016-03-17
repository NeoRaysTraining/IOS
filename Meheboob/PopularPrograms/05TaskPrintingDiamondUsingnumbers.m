
/*Objective C Program to print pattern 


  1
 123
12345
 123
  1
*/
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
int i,j,k;
   for(i=1;i<=3;i++)
{
for(j=3;j>i;j--)
printf(" ");
for(k=1;k/2<i;k++)
{
printf("%d",k);
}
printf("\n");
}
for(i=2;i>=1;i--)
{
for(j=1;j<=3-i;j++)
printf(" ");
for(k=1;k/2<i;k++)
{
printf("%d",k);
}
printf("\n");
}
   [pool drain];
   return 0;
}
