float datatype// extended precision

#import <Foundation/Foundation.h>
//main method starts execution
int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   
// Extended precision floating-point
long double aLongDouble = -9L;
NSLog(@"%Lf", aLongDouble);
NSLog(@"%Le", aLongDouble);
   
   
   [pool drain];
   return 0;
}

Output:0.000000
      1.057195e-316