#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   
    //Double pricession floating point
    double storingDoubleVal = -21.847;
    NSLog(@"%8.2f",storingDoubleVal);
   
   
   [pool drain];
   return 0;
}
