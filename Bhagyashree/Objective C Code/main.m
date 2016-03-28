//
//  main.m
//  Objective C Basics
//
//  Created by test on 3/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSString *name = @"Bhagyashree";
        
        NSLog(@"The author name is %@",name);
        
        NSArray *names = @[@"a",@"b",@"c",@"d"];
        NSLog(@"array lis are %@",names);
    }
    return 0;
}
