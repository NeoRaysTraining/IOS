

//example for if/else condition 

#import <Foundation/Foundation.h>
//main method execution //
int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

//declare age
int age=16;
check if greater than 18 then only allow

if(age >18)
{
     NSLog(@"you can vote");
}
else
{
     NSLog(@"you are not eligible for voting");
}
   NSLog (@"hello world");
   [pool drain];
   return 0;
}
