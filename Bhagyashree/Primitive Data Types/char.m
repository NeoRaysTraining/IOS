#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   //boolean variables declaration and displaying the values
   
    BOOL isBool = YES;
    NSLog(@"%d", isBool);
    NSLog(@"%@", isBool ? @"YES" : @"NO");

   NSLog (@"hello world");
   [pool drain];
   return 0;
}
