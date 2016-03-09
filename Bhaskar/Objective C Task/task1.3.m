/*problem definition

program to print amstrong numbers between 1 to 10,000
*/
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"Amstrong numbers bewteen 1 to 10,000 are");
   
   //declaring variable
   int i;
   
   //iterating i from 1 to 10,000
   for(i=1;i<10000;i++)
   {
    
    //assigning value of i to another variable 
    int number=i;
    
    //defining and initializing local variables for process
    int sum=0,rem=0;
    
    //storing value to anther variable (if we do manipulation value gets changed)
    int temp=number;
   
        //if number is greater then 0 enter into loop
        while(number>0)
        {       
                //logic to check amstrong no
                rem=number%10;
                sum=sum+rem*rem*rem;
                number=number/10;
        }
        
        //checking whether sum and temp are equal or not
        if(sum==temp)
        {       
                //prints value in the temp variable
                printf("%d \t",temp);
        
        }
        
    }
  
   [pool drain];
   //returns 0 to main
   return 0;
}
