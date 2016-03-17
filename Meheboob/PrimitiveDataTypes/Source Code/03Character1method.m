#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    //defining and initializing the char val of letter m
  char definingCharacter = 'm';
  
  //printing the val of definingCharacter variable by parsing into char & decimal
    NSLog(@"The letter %c is ASCII number %hhd", definingCharacter, definingCharacter);
  
   [pool drain];
   
   //Returns 0 to main method
   return 0;
}