#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   
   //type casting
   float f=3.12f;
   int i;
   //type casting float to int
   i=(int)f;
   NSLog(@"value of i=%d",i);   //loss of value
   
   //casting smaller DT to bigger DT
   
    short s=10;
    i=s;
    NSLog(@"value of i=%d",i);
   [pool drain];
   return 0;
}
