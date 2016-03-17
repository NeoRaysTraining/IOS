#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    //Defining & initializing tempValue variable to Boolean type value YES
    BOOL todaySatDay = NO;
    
    //Checking whether tempValue variable value is equal to Boolean val YES
    if(todaySatDay == YES )
    {
    NSLog(@"Today is Saturday");
    }
    
    //Checking whether tempValue variable value is not equal to Boolean val NO
    else if (!todaySatDay)
    {
    NSLog(@"Today is not Saturday");
    }
    
    //if condition is not satisfyies any condition 
    //it will execute this one 
    else 
    {
    NSLog(@"I dont know today is which day");
    }

   
   [pool drain];
   
   //Returns 0 to main method
   return 0;
}
