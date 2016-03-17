/*

Program to print three Dimensional Arrays of Pattern

  1,1,2                                                                                                                                                                                                        
  2,4,5                                                                                                                                                                                                        
 -1,7,8                                                                                                                                                                                            
*/




//imports basic library functions 
#import <Foundation/Foundation.h>

//main method  with return type int
int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   
   //defining and initializing local variables
   int a = 1;
   int b = 2;
   int c = -1;
   int d = 1;
   int e = 4;
   int f = 7;
   int g = 2;
   int h = 5;
   int i = 8;
   
   //printing the variables a,d,g
   printf("\n %d,%d,%d",a,d,g);
   
    //printing the variables b,e,h
   printf("\n %d,%d,%d",b,e,h);
   
    //printing the variables c,f,i
   printf("\n %d,%d,%d",c,f,i);
   
  
   [pool drain];
   
   //returns 0 to main method
   return 0;
}
