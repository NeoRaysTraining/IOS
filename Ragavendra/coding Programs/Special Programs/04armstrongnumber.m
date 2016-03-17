//write a program armstrong number  to print between 1 to 1000 

#import <Foundation/Foundation.h>
// main execution starts //
int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   //declaring variables
   
int number, temp, digit1, digit2, digit3;
 
    printf("Print all Armstrong numbers between 1 and 1000:\n");
    number = 001;
//    while loop used to iterate for up to number entered //  
    while (number <= 900)
    { 
        digit1 = number - ((number / 10) * 10);
        digit2 = (number / 10) - ((number / 100) * 10);
        digit3 = (number / 100) - ((number / 1000) * 10);
        temp = (digit1 * digit1 * digit1) + (digit2 * digit2 * digit2) + (digit3 * digit3 * digit3);
        if (temp == number)
        {
            printf("\n Armstrong no is:%d", temp);
        }
        number++;
    }
   [pool drain];
   return 0;
}

/*Output:
Armstrong numbers between 1 and 1000 are:
1
153
370
371
407*/
