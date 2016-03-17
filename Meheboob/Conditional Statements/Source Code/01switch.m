#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

//declaring and initializing the variable modelYear to 1990
    int modelYear = 1990;
    
    //giving condition to switch statement as variable modelYear
    switch(modelYear)
    {
    
    
    //checking variable modelYear is matches to 1987
        case 1987:
    //above condition is true then it prints as Your car model is 1987    
        NSLog(@"Your car model is 1987");
        
    //braek the loop to avoid the execution of next statements    
        break;
        
        
         //checking variable modelYear is matches to 1987
        case 1988:
        
        //above condition is true then it prints as Your car model is 1988 
        NSLog(@"Your car model is 1988");
         //braek the loop to avoid the execution of next statements 
        break;
        
        
        
         //checking variable modelYear is matches to 1989
        case 1989:
        //Continues the execution because there is no break statement
        case 1990:
        //above condition is true then it prints as Your car model is 1988 
        NSLog(@"Your car model is from 1989 to 1990");
         //braek the loop to avoid the execution of next statements 
        break;
        
        //If the condition is not matches for above statements it executes this default condition
        default:
        //above condition is true then it prints as I have no Idea about your car model 
        NSLog(@"I have no Idea about your car model");
        break;
    }
 
   [pool drain];
   
   //returns 0 to main method
   return 0;
}
