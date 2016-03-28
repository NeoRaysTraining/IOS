//
//  main.m
//  NSArrayFiltering
//
//  Created by Mahaboobsab Nadaf on 3/28/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Creating Array
        NSArray *myFriends = @[@"Raghu", @"Meheboobpashya", @"Porsche",
                                 @"Soumya", @"Sudha", @"Shailashree",@"Amogh",@"Bhaskar"];
        //Compares the Array Objects that Starts Befor K
        NSPredicate *beforeK = [NSPredicate predicateWithBlock:
                                ^BOOL(id evaluatedObject, NSDictionary *bindings) {
                                    NSComparisonResult result = [@"K" compare:evaluatedObject];
                                    if (result == NSOrderedDescending) {
                                        return YES;
                                    } else {
                                        return NO;
                                    }
                                }];
        //Filter the Array Objects which starts Befor K
        NSArray *namesBeforeK = [myFriends
                                 filteredArrayUsingPredicate:beforeK];
        //Prints the Array Objects
        NSLog(@"%@", namesBeforeK);
    }
    
    //returns 0 to main method
    return 0;
}
