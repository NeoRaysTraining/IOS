#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   
   // declaring variable for bool
   BOOL isBool = YES; 
   
   NSLog(@"%d", isBool);//
   NSLog(@"%@", isBool ? @"YES" : @"NO");

   [pool drain];
   return 0;
}

Output:YES
      