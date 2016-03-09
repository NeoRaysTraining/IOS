#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   
   //declaring two variables 
   int age = 18;
   int class = 2;
   
   //checking if condiotion
   if( age== 18 && class == 2 )
   {
   //if condition is true 
        NSLog(@"he belongs to karnataka age=%d and city = %d",age,class);
    }
    else
    {
    //if condition is false
        NSLog(@"he is not belongs to karmataka age=%d and city = %d",age,class);
    }
   [pool drain];
   return 0;
}
