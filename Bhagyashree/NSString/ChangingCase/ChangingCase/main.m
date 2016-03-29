//
//  main.m
//  ChangingCase
//
//  Created by test on 3/29/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Changing Case
        //Declaring and initializing string
        NSString *name = @"bHaGyAsHrEe";
        
        //converting the string to lowercase
        NSLog(@"%@",[name lowercaseString]);
        
        //converting the string to uppercase
        NSLog(@"%@",[name uppercaseString]);
        
        //converting the string to Capitalized string
        NSLog(@"%@",[name capitalizedString]);
 
        //Changing string to numerical values
        
        NSString *year = @"2016";
        
        //Convering string to boolean value
        BOOL aBool = [year boolValue];
        NSLog(@"%hhd",aBool);
        
        //Converting string to int value
        int aInt = [year intValue];
        NSLog(@"%d",aInt);
        
        //Converting string to float value
        float aFloat = [year floatValue];
        NSLog(@"%f",aFloat);
        
        //Convrting string to long value
        long aLong = [year longLongValue];
        NSLog(@"%ld",aLong);
        
    }
    return 0;
}
