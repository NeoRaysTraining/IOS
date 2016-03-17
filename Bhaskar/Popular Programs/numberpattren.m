
/*Problem Defnition
program has to print the following output                                                                                                                                                                                                   
1
123
12345
1234567
123456789
123456
12345
1234
123
1

*/
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    NSLog (@"hello world");
    
    //declaring the variablesto use for loop
    int i, j;
    
    //declaring for loop for i to print 9 colums
    for(i=1;i<=9;i+=2)
    {
        //declaring for loop for j to print the rows
        for(j=1;j<=i;j++)
		//printing the value of j
        printf("%d",j);
		//move to new line
         printf("\n");
    }
    //declaring 2nd for loop for i to second table after 9 values
    for(i=6;i>=1;i-=1)
    {
        //declaring 2nd for loop for j and assigning the value of i
        for(j=1;j<=i;j++)
		//prints the value of j
        printf("%d",j);
        printf("\n");
    }
    [pool drain];
    return 0;
}
