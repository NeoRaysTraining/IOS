#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   
   // declaring integer variable age
   int age = 45;
   
   //checking if condition
   if(age <= 10)
   {
        NSLog(@"he is a kid his age is %d",age);
    }
   else if(age == 20)
   {
        NSLog(@"person is youngster %d",age);
    }
    else if(age <=40)
    {
        NSLog(@"he crossed the 25 and present age is %d",age);
    }
    else 
    {
        NSLog(@"he is a pention holder his age is %d",age);
    }
   
   [pool drain];
   return 0;
}
