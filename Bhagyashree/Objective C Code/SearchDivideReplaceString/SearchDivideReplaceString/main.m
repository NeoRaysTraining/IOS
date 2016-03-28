//
//  main.m
//  SearchDivideReplaceString
//
//  Created by test on 3/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *employee = @"Bhagyashree";
        NSString *company =@"IT Contractors";
        
        NSRange result = [company rangeOfString:@"IT"];
        if(result.location==NSNotFound)
        {
            NSLog(@"Result not found");
        }
        else
        {
            NSLog(@"The string starts at %lu and is of length %lu is found",result.location,result.length);
        }
        
        NSLog(@"%@",[employee substringFromIndex:8]);
        NSLog(@"%@",[company substringToIndex:2]);
        NSRange range =NSMakeRange(3, 13);
        
    }
    return 0;
}
