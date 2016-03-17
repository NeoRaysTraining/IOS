//write a program to display 1 123 1234 123 1 //

#import <Foundation/Foundation.h>
 
 //main execution starts
int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   
   //declaring  the variables
int i,j,k;
 //for loop printing the nunber of 3rows
   for(i=1;i<=3;i++)
{
//loop printing the spaces
for(j=3;j>i;j--)
printf(" ");
//loop for printing the numbers
for(k=1;k/2<i;k++)
{
//print for k values it shifts
printf("%d",k);
}
//printing  new next line
printf("\n");
}
for(i=2;i>=1;i--)
{
//loop printing the spaces
for(j=1;j<=3-i;j++)
printf(" ");
for(k=1;k/2<i;k++)
{
//loop for printing the numbers
printf("%d",k);
}
// printing  newline
printf("\n");
}
   [pool drain];
   return 0;
}

Output:
1
123
12345
123
1