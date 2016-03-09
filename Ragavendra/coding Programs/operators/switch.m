
// write a program for switch and case statements 

switch:it is used to execute particular set of statement amoung multiple statements we go for switch
break:it is optional it will transfer control out of the loop it will used to 

#import <Foundation/Foundation.h>

//main method starts execution
int main()
{
// declare and initialize the variable //
   char schar='R';
  
  // switch  which data type you used only that value is allowed   //
  switch(schar)
   {
   case 'P':
   NSLog(@"Excellent");
   break;
   
   case 'Q':
   NSLog(@"well  done");
   break;
   
   case'R':
   NSLog(@"Extrauordinary");
   break;
   
   case 'S':
   NSLog(@"try next time");
   break;
   
   
   
   }
   
   return 0;
}

Output: Extrauordinary