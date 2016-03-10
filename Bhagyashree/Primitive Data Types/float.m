#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   
 //single precesion floating point variables Declaration and printing
   
   float aFloat = 11.01f;
   NSLog(@"%f", aFloat);
   NSLog(@"%8.2f", aFloat);

//double precesion floating point variables Declaration and printing
   
   double aDouble = 22.02;
   NSLog(@"%8.2f", aDouble);
   NSLog(@"%e", aDouble);
   
   //extended precesion floating point variables Declaration and printing
   
   long double alongdouble = 11.01e91;
   NSLog(@"%Lf", aFloat);
   NSLog(@"%Le", aFloat);


   NSLog (@"hello world");
   [pool drain];
   return 0;
}
