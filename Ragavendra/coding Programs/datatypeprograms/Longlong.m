#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
// Long)

long longVal = -9223375403685477;
unsigned long anUnsignedLongval = 18446744073709551615;
NSLog(@"%ld", longVal);
NSLog(@"%lu", anUnsignedLongval);

   
   [pool drain];
   return 0;
}
