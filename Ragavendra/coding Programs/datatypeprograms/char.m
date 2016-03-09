// char dattatype//


#import <Foundation/Foundation.h>

// main method starts execution
int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   
   // declaring variable for char
      char c='r';
   //  declaring ascii value 
   unsigned char Unsignchar = 255;
   
   NSLog(@"The letter %c is ASCII number %hhd", c, Unsignchar);
  
  //to print  ascii  value
  
  
   [pool drain];
   return 0;
}

Output:The letter r is ASCII number 255