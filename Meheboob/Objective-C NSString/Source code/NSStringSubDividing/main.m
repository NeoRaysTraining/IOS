//
//  main.m
//  NSStringSubDividing
//
//  Created by test on 3/27/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Creating a String
        NSString *myString = @"Meheboob Nadaf";
        
        //Prints substring upto 8 Characters
        NSLog(@"%@",[myString substringToIndex:8]);
        
         //Prints substring Characters from 9 onwards
        NSLog(@"%@",[myString substringFromIndex:9]);
        
        //Makes the range of starts from 9 after 5 Characters
        NSRange stringRange = NSMakeRange(9, 5);
        
        //Prints the substring with a given Range
        NSLog(@"%@",[myString substringWithRange:stringRange]);
        
        //Creating String
        NSString *lastNames = @"Tendulkar,Dravid,Dhoni";
        
        //Creating Array of String Objects
        NSArray *lastNamesAsArray = [lastNames componentsSeparatedByString:@","];
        
        //Prints the Object at Given index
        NSLog(@"%@",[lastNamesAsArray objectAtIndex:1]);
    }
    return 0;
}
