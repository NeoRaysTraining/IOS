//
//  main.m
//  Objective-CMathFunctions
//
//  Created by Meheboob Nadaf 
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
      //Defining & initializing local Variables
       
        int i = 20;
        
        float f = 31.37;
        
        double d = 9.32e12;
        
        char c  ='M';
       
        //Print Statement
        NSLog(@"Int val %i",i);
        
        NSLog(@" Float Val %f",f);
        
        NSLog(@" Double Val %e",d);
        
        NSLog(@" Charctar Val %c",c);
        
        
        int sum = 3+2*7;
        
        NSLog(@"The Sum of 3+2*7 is %i",sum);
        
        float m = 38%7;
        NSLog(@"%f",m);
        
        
        //Defining & initializing local Variables
        float aFloatval = 20.56;
        int aIntValue;
        float aFloatValTwo;
        
        int intVal1 = 15;
        int intval2 = 10;
        
        aFloatValTwo = intVal1/intval2;
        
         NSLog(@"int to float val %f",aFloatValTwo);
        
        
        aIntValue = aFloatval;
        
        NSLog(@" Float to int val %i",aIntValue);
        
        aFloatValTwo  =aFloatval/intval2;
        
        NSLog(@"%f",aFloatValTwo);
        
       
        
        
    }
    //Returns 0 to main method
    return 0;
}
