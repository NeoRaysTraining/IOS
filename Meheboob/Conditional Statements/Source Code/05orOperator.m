#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    //Defining & initializing variables
    
    int a = 5;
    int b = 10;
    int c = 15;
    
    //Checking whether a is having higher val than b or c
    if(a>b || a>c)
    {
    NSLog(@"a is greather than b and c");
    }
     //Checking whether b is having higher val than a or c
    else if(b>a || b>c)
     {
    NSLog(@"b is greather than a and c");
    }
     //Checking whether c is having higher val than b or a
    else if(c>a || c>b)
     {
    NSLog(@"c is greather than a and b");
    }
	//if condition is not satisfyies any condition 
    //it will execute this one
    else
    {
    NSLog(@"None of them greather than with each other");
    }
   
   [pool drain];
   
   //Returns 0 to main method
   return 0;
}
