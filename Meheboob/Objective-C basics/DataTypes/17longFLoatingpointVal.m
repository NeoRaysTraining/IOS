#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   
   // Extended precision floating-point
   
   long double aLongDouble = -21.07e8L;
    NSLog(@"%Lf", aLongDouble);
    NSLog(@"%Le", aLongDouble);
   
   [pool drain];
   return 0;
}
