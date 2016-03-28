//
//  main.m
//  StringWithFormat
//
//  Created by test on 3/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
     
        
        //Declaring two strings with different values
        NSString *string1 = [NSString stringWithFormat:@"Bhagyashree"];
        NSString *string2 = @"Bhagyashri";
        NSString *company = @"IT Contractors";
        
        //Comparing two strings with == operator..
        if(string1==string2)
        {
            //Print message if the strings are equal
            NSLog(@"Strings are equal");
        }
        else
        {
            //Print message if the strings are not equal
            NSLog(@"Not equal");
        }
        
        
        //Comparing two strings with isEqualTo method..
        if([string1 isEqualToString:string2])
        {
            
            //Print message if the strings are equal
            NSLog(@"Strings are equal");
        }
        else
        {
            
            //Print message if the strings are not equal
            NSLog(@"Not equal");
        }
        
        
        //Using hasPrefix method
        if([company hasPrefix:@"IT"])
        {
            NSLog(@"Company name starts with IT");
        }
        
        //Using hasSuffix method
        if([company hasSuffix:@"Contractors"])
        {
            NSLog(@"Company name ends with Contractors");
        }
        
    }
    return 0;
}
