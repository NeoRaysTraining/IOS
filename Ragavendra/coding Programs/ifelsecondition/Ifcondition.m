#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   // declare variables //
   int a=10;
   // for if condition 
   if(a<20)
   {
   printf("the value of a is less than given number %d",a);
   }
   
   
   
   
   [pool drain];
   return 0;
}
