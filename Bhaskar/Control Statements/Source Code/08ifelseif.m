#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   int percentage=80;
   //checking percentage to display pass class
   if(percentage>=80 && percentage<=100)      
   {
    NSLog(@"FCD");
   }
   else if(percentage>=60 && percentage<80)
   {
   NSLog(@"FC");
   }
   else if(percentage>=50 && percentage<60)
   {
   NSLog(@"SC");
   }
   else if(percentage>=35 && percentage<50)
   {
   NSLog(@"Pass");
   }
   else if(percentage >=1 && percentage<35)
   {
   NSLog(@"fail");
   }
   else
   NSLog(@"invalid");
   [pool drain];
   return 0;
}
