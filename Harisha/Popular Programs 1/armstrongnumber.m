/*Problem Defnition
Program to print the armstrong numbers from 1 to 10000
the out put of the program is give below
1
153
370
371
407
*/
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   //creating integer variable n to use in for loop
    int n;
    
    //Declaring for loop for the iteration from 1 to 10000
    for( n=10;n<10000;n++)
    {
    //creting variable sum 
    int sum=0;
    
    //creating variable num and and assigning n 
    int num = n;
    
    //creting the integer variable rem
    int rem=0;
    
    //creating the variable temp to store the value of num
    int temp = num;
    
    //declaring while loop to check the num is greator than 0
    while(num>0)
    {
    //finding the reminder to extract the number
    rem = num%10;
    
    //multiplying the reminder to find the armstrong number
    sum = sum+rem*rem*rem;
    
    //dividing the number by 10
    num = num/10;
    }
    
    //declaring if to check with sum with temp
    if(temp==sum)
    {
	//prints the armstrong numbers
    NSLog(@"arm strong numbers are %d",sum);
    }
    }
    
    
   [pool drain];
   return 0;
}
