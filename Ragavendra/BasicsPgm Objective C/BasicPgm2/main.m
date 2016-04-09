//
//  main.m
//  BasicPgm2
//
//  Created by test on 4/8/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//
///****************Basics programs ******************

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
/*
int i=20;
float f=99.9;
double d=9.32e+12;
char r='r';
        
        
NSLog(@"integer value %i",i);
NSLog(@"fraction value %f",f);
NSLog(@"double value %e",d);
NSLog(@"char value value %c",r);
        
int sum=3+2*4;
NSLog(@" sum value is %i",sum);*/

/*

float f1=20.75;
float f2;
int i1;
int i2=15,i3=10;
i1=f1;
NSLog(@"After the  i1 value %i",i1);
        

f2=i2/i3;
NSLog(@"Float value %f",f2);*/

        
//for loop by user entering value //

        
int i, usernum;
NSLog(@"Enter Number: ");
scanf("%i",&usernum);

for( i=1;i<usernum; i++)
NSLog(@"the Entered value is : %i",i);

        
/*// while Loop //
int number=1;
int r;
printf("Enter value:");
scanf("%i",&r);
while (number<=5)
{
NSLog(@"The Multiplication  %i times:%i=%i",number,r,number*r);

    number++;
}*/
        
//do whileLoop//
        
int n=1;
        
do{
NSLog(@"Entered num %i s   squared is  %i", n, n*n);
n++;

}
while (n<=5);

    
    

        
        
    }
    return 0;
}
