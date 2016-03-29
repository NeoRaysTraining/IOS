//
//  main.m
//  CombiningString
//
//  Created by test on 3/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSString *string1 = [NSString stringWithFormat:@"Bhagyashree"];
        NSString *company = @" IT Contractors";
        
        NSString *employee = [string1 stringByAppendingString:company];
        
        NSLog(@"Employee details:%@",employee);
        
        NSString *details = [string1 stringByAppendingFormat:@"%@",company];
        
        NSLog(@"Employee name and company:%@", details);
        
        //Using NSRange to specify the range of a string
        NSRange result = [string1 rangeOfString:@"shree"];
        
        //checks whether the string present
        if(result.location==NSNotFound)
        {
            //if the specified string is not found it prints the message
            NSLog(@"Search not found");
        }
        else
        {
            //Location and length of a specified string is printed
            NSLog(@"The string found at %lu and is %lu characters long",result.location,result.length);
        }

        
        
    }
    return 0;
}
