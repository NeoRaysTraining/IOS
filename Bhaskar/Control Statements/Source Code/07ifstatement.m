#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   int age=18;
    //checking conditon for age
   if(age>=18)     
   {
	//if age is greater then 18 following things will execute
    NSLog(@"eligible for voting");
   }
   else
   {
   //executes when age is below 18
   NSLog(@"not eligible for voting");
   }
   [pool drain];
   return 0;
}