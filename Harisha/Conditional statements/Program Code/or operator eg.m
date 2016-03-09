#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   
   //declaring two variables 
   int age = 19;
   int class = 2;
   
   //checking if condiotion
   if( age== 18 || class == 3)
   {
   //if condition is true 
        NSLog(@"he belongs to karnataka age=%d and class = %d",age,class);
    }
    else
    {
    //if condition is false
        NSLog(@"he is not belongs to karmataka age=%d and class = %d",age,class);
    }
   [pool drain];
   return 0;
}
