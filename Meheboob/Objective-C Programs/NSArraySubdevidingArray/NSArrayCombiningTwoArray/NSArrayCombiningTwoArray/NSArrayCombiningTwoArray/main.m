//  main.m
//  NSArrayCombiningTwoArray
//
//  Created by test on 3/28/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Creating Array
        
        NSArray *myCollegeFriends = @[@"Soumya",@"Sudha",@"Manjunath",@"Mohan",@"Prashant"];
        //Creating Array
        NSArray *myOfficeFriends = @[@"Raghavendra",@"Priyanka",@"Khadhir",@"Harish",@"Bhaskar",@"Bhagyashree"];
        
        //Adding Two Arrays
        NSArray *myAllFriends = [myCollegeFriends arrayByAddingObjectsFromArray:myOfficeFriends];
        
        //Printing Array Object myAllFriends
        NSLog(@"All Frinds : %@",myAllFriends);
        
        //Priting Objects by Seperating usinh ',' Symbol
        
        NSLog(@"%@",[myAllFriends componentsJoinedByString:@","]);
    }
    //Returns 0 to main method
    return 0;
}
