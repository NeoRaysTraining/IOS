#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    //Defining & initializing personAge variable to 20
    int personAge = 20;
    
    //Checking weather personAge variable contains less than 10 value
    if(personAge < 10)
    {
    NSLog(@"It's a kids Age");
    }
    
    //Checking weather personAge variable contains less than or equal to 20 value
    else if(personAge <= 20)
    {
    NSLog(@"It's students age");
    }
    
   //Checking weather personAge variable contains greather than or equal to 25 value
    else if(personAge >= 25)
    {
    NSLog(@"It's Workers Age");
    }
    
    //If personAge variable's value not satisfyies the above conditions
    //It prints this message 
    else
    {
    NSLog(@"There is nothing special about this age");
    }

   
   [pool drain];
   
   //Returns 0 to main method
   return 0;
}
