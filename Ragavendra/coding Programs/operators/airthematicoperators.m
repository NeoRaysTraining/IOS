//Airthematic operators
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  // initalizing variables //
   int a=20;
   int b=10;
   
//additon
c = a + b;
   NSLog(@"1 - Value of c is %d\n", c );
  
  // substraction
  c = a - b;
   NSLog(@"2 - Value of c is %d\n", c );
  //multiplication
   c = a * b;
   NSLog(@"3 - Value of c is %d\n", c );
   //division
   c = a / b;
   NSLog(@"4 - Value of c is %d\n", c );
   //mod
   c = a % b;
   NSLog(@"5 - Value of c is %d\n", c );
 //  increment
   c = a++; 
   NSLog(@"6 - Value of c is %d\n", c );
   //decrement
   c = a--; 
   NSLog(@"7 - Value of c is %d\n", c );

   NSLog (@"hello world");
   [pool drain];
   return 0;
}
