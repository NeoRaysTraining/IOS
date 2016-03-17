/*
Objective C Program to print Armstrong Numbers from 1 to 10000  
& counting how many Armstrong numbers are there from 1 to 10000 
*/

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  //defining the variables like digits, cube, scube &
  //initializing the count varaible to 0
  int sn,en,i,num,digit,cube,scube,count=0;
  
  //initializing the starting number to 1
  sn = 1;
  
  //initializing the end number to 10000
  en = 10000;
  
  //Print statement
  printf("These are Armstrong numbers from 1 to 10000");
 //looping the numbers from starting to ending number
  for(i=sn;i<=en;i++)
  {
  //initializing the num variable to whatever the contents of i variable
    num = i;
 //initializing the subcube variable to 0
    scube = 0;
 //go ahead onle when number is greather than o    
    while(num > 0)
    {
 //Applying modulus operator to take last digit of the number
    digit = num%10;
 //multiflying the digit for 3 time to take cube of number    
    cube = digit*digit*digit;
 //Adding the value of cube to subcube variable    
    scube = scube + cube;
    
 //Applying modulus operator to take last digit because 
 //integer type variable not
    num = num/10;
    }
   
 //checking the subcube variable is equal to i variable
    if(scube == i)
    {
 //prints the value of i
 
    printf("\t %d",i);
 //counts how many Armastrong numbers    
    count++;
    }
  }
  
  //prints how many Armastrong numbers of given range
  printf("\n");
  printf("There are total Armstrong numbers from 1 to 10000 is \t");
  printf("%d",count);

   [pool drain];
   
  //Returns 0 to main method 
   return 0;
}
