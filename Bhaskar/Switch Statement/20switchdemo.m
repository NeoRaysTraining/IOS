#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   //declaring char variable to store type of operator
   char operator='-';
   
   //hard coding values with floating point values
   float number1=12.0f,number2=10.0f,result=0.0f;
   
   //checking type of operator and performing operation depending on type
   switch(operator)
   {
    case '+':   NSLog(@"You have choosen addition operation");
                result=number1+number2;
                NSLog(@"sum of %2.2f + %2.2f= %2.2f",number1,number2,result);
                break;
    case '-':   NSLog(@"You have choosen addition operation");
                result=number1-number2;
                NSLog(@"sum of %2.2f - %2.2f= %2.2f",number1,number2,result);
                break;
    default:    NSLog(@"you have choosen invalid operator");
                 break;
   }
   return 0;
}
