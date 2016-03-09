#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
// 3)short

 // declare short variable
short aShort = -32768;
unsigned short anUnsignedShort = 65535;
NSLog(@"%hd", aShort);
NSLog(@"%hu", anUnsignedShort);
   [pool drain];
   return 0;
}
