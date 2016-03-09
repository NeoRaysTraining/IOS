#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   //program to find largest of 3 numbers
   int a=10,b=12,c=5;
   if(a>b)
   {
    if(a>c)
    {
        NSLog(@"%d is big", a);
    }
    else
    {
        NSLog(@"%d is big", c);
    }
   }
   else
   {
    if(b>c)
    {
        NSLog(@"%d is big", b);
    }
    else
    {
        NSLog(@"%d is big", c);
    }
   }
   [pool drain];
   return 0;
}
