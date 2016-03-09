#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   // find the grade of students

// using conditional operators and if else statements

BOOL attend = YES;
int score = 75;
if(!attend)                 //checking whether the student not attended exam
{
NSLog(@"ABSENT");
}
else
{
if(score >=90 && score < 100)   //checking whether the score is greter than or equal to 90 and less than 100
{
NSLog(@"S grade");
}
 else if(score >=75 && score < 90)  //checking whether the score is greter than or equal to 75 and less than 90
 {
NSLog(@"A grade");
}
else if(score >=65 && score < 75)    //checking whether the score is greter than or equal to 65 and less than 75
{
NSLog(@"B grade");
}
else if(score >=55 && score < 65)    //checking whether the score is greter than or equal to 55 and less than 65
{
NSLog(@"C grade");
}
else if(score >=40 && score < 55)    //checking whether the score is greter than or equal to 40 and less than 55
{
NSLog(@"D grade");
}
else{                               //else the score is less than 40 i.e fail
NSLog(@"FAIL");
}
}

   
   [pool drain];
   return 0;
}
