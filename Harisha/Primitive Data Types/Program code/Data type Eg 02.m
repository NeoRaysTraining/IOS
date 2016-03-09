#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   
   //Declaring 1st variable
   int value1 = 10;
   
   //printing 1st variable
   NSLog (@"value of 1st variable is %d",value1);
   
   //Declaring 2nd variable
   double value2 = 10.08;
   NSLog(@"Value of Double variable is %f",value2);
   
   //Casting variable from double to int
   double value3 = 20.002;
   int value4 = (int)value3;
   NSLog(@"value of Casteing is %d",value4);
   
   [pool drain];
   return 0;
}
