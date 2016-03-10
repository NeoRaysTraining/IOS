#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

// check BOOL data type

BOOL isBool = YES;
NSLog(@"%d", isBool);
NSLog(@"%@", isBool ? @"YES" : @"NO");
   
   
BOOL isbool = NO;
NSLog(@"%d", isbool);
NSLog(@"%@", isbool ? @"YES" : @"NO");
    
    
   [pool drain];
   return 0;
}
