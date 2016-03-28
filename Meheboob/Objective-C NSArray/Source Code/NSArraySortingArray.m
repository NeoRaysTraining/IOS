//
//  main.m
//  NSArraySortingArray
//
//  Created by Mahaboobsab Nadaf on 3/27/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Creating Array
        NSArray *myFriends = @[@"Raghavendra",@"Datta",@"Vithal",@"Khadhir",@"priyanka",@"Bhagyashree"];
        
        //Prints Object myFriends
        NSLog(@"My Friends : %@ ",myFriends);
        
        
        //Sorting Array by Size
        NSArray *SortedNames = [myFriends sortedArrayUsingComparator:^NSComparisonResult(id  obj1, id  obj2) {
            if([obj1 length]<[obj2 length])
                            {
                                return NSOrderedAscending;
                            }
                            else if([obj1 length]>[obj2 length])
                            {
                                return NSOrderedDescending;
                            }
                            
                            else             {
                                return NSOrderedSame;
                            }
            

        }];
        //Prints Array Object of SortedNames
        NSLog(@"My Friends With Alpabetical Order : %@ ",SortedNames);
       
    }
    return 0;
}
