/*

Program to print three Dimensional Arrays of Pattern

 1  5   5                                                                                                                                                                                                        
 19 53 83                                                                                                                                                                                                     
 23 64 97                                                                                                                                                                                           
                                                                                                                                                                                            
*/



//imports basic library functions 
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   
   int a = 1;
   int b = 2;
   int c = -1;
   int d = 1;
   int e = 4;
   int f = 7;
   int g = 2;
   int h = 5;
   int i = 8;
   
   int z1 = a*a+b*d+c*g;
   int z2 = a*b+b*e+c*h;
   int z3 = a*c+b*f+c*i;
   
   int z4 = d*a+e*d+f*g;
   int z5 = d*b+e*e+f*h;
   int z6 = d*c+e*f+f*i;
   
   int z7 = g*a+h*d+i*g;
   int z8 = g*b+h*e+i*h;
   int z9 = g*c+h*f+i*i;
   
   printf("\n %d,%d,%d",z1,z2,z3);
   printf("\n %d,%d,%d",z4,z5,z6);
   printf("\n %d,%d,%d",z7,z8,z9);
   
  
   [pool drain];
   return 0;
}
