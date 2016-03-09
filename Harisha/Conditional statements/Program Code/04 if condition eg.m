
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   
   //creating a 2 variables a and b
   int a = 10;
   int b = 20;
   NSLog(@"1st if condition");
   //if condition to check two varibles
   if(a == b)
   {
        // if two values are equal prints 
        NSLog(@"the given values are equal %d,%d",a,b);
    }
    else
    {
        //if two values are not equal prints this
        NSLog(@"the given values are not equal a=%d,b=%d",a,b);
    }
    
    //checking for eqauls condition 
    NSLog(@"Second if condtion");
    
    //creating 3rd variable 
    int x = 10;
    
    if(a == x)
    {
        NSLog(@"the given values are equal a=%d and x=%d",a,x);
    }
    else
    {
        NSLog(@"The given values are not equal a=%d and x=%d",a,x);
    }
    
    
        
   
   
   [pool drain];
   return 0;
}
