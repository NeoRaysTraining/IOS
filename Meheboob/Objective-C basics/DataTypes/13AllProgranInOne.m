#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   
   //defining & initializing Boolean type data tye
  BOOL checkBooleanOrNot = YES;   
 
 //Printing the val of checkBooleanOrNot variable
  NSLog(@"%d", checkBooleanOrNot); 
  
  //defining & initializing Boolean type data tye
BOOL checkBooleanOrNot = NO;    
  
  
//Printing the val of checkBooleanOrNot variable using ternary operator
NSLog(@"%@", checkBooleanOrNot ? @"YES" : @"NO"); 

//defing and initializing the char val of letter m
  char definingCharacter = 'm';
  
  //printing the val of definingCharacter variable by parsing into char & decimal
    NSLog(@"The letter %c is ASCII number %hhd", definingCharacter, definingCharacter);
    
    
    //defing and initializing the initialzeUnsignedChar to 123
  unsigned char initialzeUnsignedChar = 123;
  
  //Printing the unsigned initialzeUnsignedChar variable
  NSLog(@"%hhu",initialzeUnsignedChar);
  
  //Defing a short type of val & storing it into storingShortTypeVal Variable
    
    short storingShortTypeVal = -1453;
    
    //Printing the val of storingShortTypeVal variable
    
    NSLog(@"%hd",storingShortTypeVal);
    
     //Defing an unsigned short type of val & storing it into storingShortTypeVal Variable
    
   unsigned short storingShortTypeVal = 1234;
    
    //Printing the val of storingShortTypeVal variable
    
    NSLog(@"%hu",storingShortTypeVal);
    
    //Defining & initializing an intiger val to anIntegerTypeOfVal variable
    
    int anIntegerTypeOfVal = -1234678353;
    
    //Printing the val of anIntegerTypeOfVal
    
    NSLog(@"%d",anIntegerTypeOfVal);
    
    //defining an unsigned integer val
    unsigned int storingunsignedInt = 136515638;
    
    //Printing the value of storingunsignedInt variable
    
   NSLog (@"%u",storingunsignedInt);
   
   //defining & storing an long type of val
  
   long longTypeOfVal = -46476432131709874;
    
    //Printing the value of longTypeOfVal variable
    
   NSLog (@"%ld",longTypeOfVal);
   
   //defining & storing an unsigned long type of val
  
   long unsignedLongTypeOfVal = 5354365464764321317;
    
    //Printing the value of longTypeOfVal variable
    
   NSLog (@"%lu",unsignedLongTypeOfVal);
   
     //defining & storing an long long type of val
  
   long long  longLongTypeOfVal = -9223372036854775808;;
    
    //Printing the value of longLongTypeOfVal variable
    
   NSLog (@"%lld",longLongTypeOfVal);

    //defining & storing an long long type of val
  
  unsigned long long  unsignedlongLongTypeOfVal = 2545456456455534345;
    
    //Printing the value of longLongTypeOfVal variable
    
   NSLog (@"%llu",unsignedlongLongTypeOfVal);
   
  
   
   //Returns 0 to main method
   return 0;
}
