// write a  basic program for do while // 

#import <Foundation/Foundation.h>
 
 //main method starts execution //
int main ()
{
   /* local variable definition */
   int a = 10;

   /* do loop execution */
   do
   {
       NSLog(@"value of a: %d\n", a);
       a = a + 1;
   }
   // check condition //
   while( a < 20 );
 
   return 0;
}
Output:
 value of a: 10
 value of a: 11
 value of a: 12
 value of a: 13
 value of a: 14
 value of a: 15
 value of a: 16
 value of a: 17
 value of a: 18
 value of a: 19