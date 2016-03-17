/*

 Objective C program to Matrix multiplication
 
 */

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
   
    int aa = 2*1;
   int bb = 2*2;
   int cc = 2*-1;
   int dd = 2*1;
   int ee = 2*4;
   int ff = 2*7;
   int gg = 2*2;
   int hh = 2*5;
   int ii = 2*8;
   
   int aaa = 1;
   int bbb = 0;
   int ccc = 0;
   int ddd = 0;
   int eee = 1;
   int fff = 0;
   int ggg = 0;
   int hhh = 0;
   int iii = 1;
   
   int zz1 = z1-aa+aaa; 
   int zz2 = z2 -bb+bbb;
   int zz3 = z3 -cc+ccc;
   int zz4 = z4 -dd+ddd;
   int zz5 = z5 -ee+eee;
   int zz6 = z6 -ff+fff;
   int zz7 = z7 -gg+ggg;
   int zz8 = z8 -hh+hhh;
   int zz9 = z9 -ii+iii;
   
   
   printf("\n %d,%d,%d",zz1,zz2,zz3);
   printf("\n %d,%d,%d",zz4,zz5,zz6);
   printf("\n %d,%d,%d",zz7,zz8,zz9);
   
  
   [pool drain];
   return 0;
}
