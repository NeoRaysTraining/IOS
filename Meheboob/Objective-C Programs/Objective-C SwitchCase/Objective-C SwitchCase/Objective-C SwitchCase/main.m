//
//  main.m
//  Objective-C SwitchCase
//
//  Created by test on 4/6/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Defining and initializing local variable
        int age = 7;
        
        //Switch case statements
        switch (age) {
                
            case 1:
                NSLog(@"They are Cute");
                break;
                
            case 2:
                NSLog(@"They are Terrible");
                break;
               
            case 3:
                NSLog(@"They are Thirsty");
                break;
                
            case 4:case 7:
                NSLog(@"They are 4 to 7 years old");
                break;
                
            default:
                
                NSLog(@"They are not a Kid's");
                break;
        }
    }
    return 0;
}
