#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   
    //Double pricession floating point
    double storingDoubleVal = -21.847;
    
    //Printing the val using exponential
    NSLog(@"%e",storingDoubleVal);
   
   
   [pool drain];
   return 0;
}
