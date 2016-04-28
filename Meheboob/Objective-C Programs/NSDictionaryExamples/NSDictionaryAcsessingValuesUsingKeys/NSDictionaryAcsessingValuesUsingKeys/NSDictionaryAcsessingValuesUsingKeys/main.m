//
//  main.m
//  NSDictionaryAcsessingValuesUsingKeys
//
//  Created by test on 3/29/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Creating Dictionary Object
        NSDictionary *empNameAndId = @{
                                  
                                  @"Meheboob" :[NSNumber numberWithInt:145],@"Raghavendra":[NSNumber numberWithInt:146],
                                  @"Bhagyashree":[NSNumber numberWithInt:147],@"Harish" : [NSNumber numberWithInt:148],@"Bhaskar" :[NSNumber numberWithInt:149]
                                      };

        NSLog(@"The Employee ID of Meheboob is : %@",empNameAndId[@"Meheboob"]);
        
        NSLog(@"The Employee ID of Bhagyashree is : %@",[empNameAndId objectForKey:@"Bhagyashree"]);
    }
    return 0;
}
