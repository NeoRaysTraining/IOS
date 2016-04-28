//
//  main.m
//  NSMutableArrayExamples
//
//  Created by test on 3/28/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Craeting Mutable Array
        NSMutableArray *laptopCompanies = [NSMutableArray arrayWithObjects:@"Lenovo",@"Mac",@"HP",@"HCL",@"Dell", nil];
        
        //Prints var laptopCompanies
        NSLog(@"Laptop Companies are : %@",laptopCompanies);
        
        //Adds the object at last
        [laptopCompanies addObject:@"Sony"];
        
        //Prints var laptopCompanies
        NSLog(@"Laptop Companies By Adding Sony are : %@",laptopCompanies);
        
        //Removes last object
        [laptopCompanies removeLastObject];
        
        //Prints var laptopCompanies
        NSLog(@"Laptop Companies By Removing Sony are : %@",laptopCompanies);
    }
    return 0;
}
