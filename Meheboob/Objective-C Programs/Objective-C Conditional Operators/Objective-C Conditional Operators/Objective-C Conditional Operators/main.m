//
//  main.m
//  Objective-C Conditional Operators
//
//  Created by test on 4/6/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        //Defining and initializing local variables
        int a=2;
        
        int b = 3;
        
        int c = 0;
        
        a == b ? NSLog(@"They Are equal"): NSLog(@"They are different");
        
        //Only when var 0 then it will execute false statement
        c ? NSLog(@"TRUE") : NSLog(@"FALSE");
    }
    return 0;
}
