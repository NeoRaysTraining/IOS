#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    //Defining & initializing tempValue variable to 27
    int tempValue = 27;
    
    //Checking whether tempValue variable value is not equal to 27
    if(tempValue != 27)
    {
    NSLog(@"It's not good temprature for humans");
    }
    
    //If above conditions are not satisfyies it will execute this statement
    else
    {
    NSLog(@"It's good temprature for humans");
    }

   
   [pool drain];
   
   //Returns 0 to main method
   return 0;
}
