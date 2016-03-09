#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   
   
   //boolean datatype
   BOOL isBool= NO;
   NSLog(@"%@",  isBool ? @"YES":@"NO" );
   [pool drain];
   return 0;
}
