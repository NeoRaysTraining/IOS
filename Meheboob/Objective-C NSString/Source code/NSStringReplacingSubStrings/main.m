//
//  main.m
//  NSStringReplacingSubStrings
//
//  Created by test on 3/27/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Creating String
        NSString *myFullName = @"Meheboob Nadaf";
        
        //makes the range
        NSRange stringrange = NSMakeRange(9,5);
        
        //repacing String by Another String with a given Range
        NSString *aboutMe = [myFullName stringByReplacingCharactersInRange: stringrange withString:@"Genius"];
        
        NSLog(@" About Me : %@ ",aboutMe);
        
         //repacing String by Another String
        NSString *aboutMySelf =[myFullName stringByReplacingOccurrencesOfString:@"Nadaf" withString:@"VGood"];
        
        NSLog(@" About Me : %@ ",aboutMySelf);
        
        
    }
    return 0;
}
