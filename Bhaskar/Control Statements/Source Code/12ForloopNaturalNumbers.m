#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   //printing natural numbers 
   int i=0,n=10;
   NSLog(@"Natural numbers are ");
   //for loop is used to check conditon and if specified conditon is not met it increments
   for(i=0;i<=n;i++)
   {
        NSLog(@"%d",i);
   }
   [pool drain];
   return 0;
}
