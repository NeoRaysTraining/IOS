//
//  main.m
//  Objective-CBasicsAddingNumbers
//
//  Created by test on 4/5/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        //Prints new line
        NSLog(@"Here is new line \n This statement is in new line");
        
        
        //defining and initializing variables
        int numberOne = 10;
        int numberTwo  =20;
        
        //Print statement by parsing variables
        NSLog(@"My Fav numbers are %i and %i",numberOne,numberTwo);
        
        //defining and initializing variables
        int var1 = 45;
        
        int var2 = 33;
        
        int sumOfTwoNum = var1+var2;
        
         //Print statement by parsing variables
        NSLog(@"the sum of %i and %i is %i",var1,var2,sumOfTwoNum);
        
    }
    return 0;
}
