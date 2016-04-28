//
//  main.m
//  NSDictionaryAccessingValuesAndKeys
//
//  Created by test on 3/29/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
    //Creating Dictionary
        
        NSDictionary *carStock = @{
                                   @"Mahendra Bulero":[NSNumber numberWithInt:7],
                                   
                                    @"Mahendra Verito":[NSNumber numberWithInt:0],
                                    @"Mahendra Pick-Up":[NSNumber numberWithInt:40],
                                    @"Mahendra Jeep":[NSNumber numberWithInt:0],
                                   @"TATA Nano":[NSNumber numberWithInt:9],
                                   @"TATA Sumo":[NSNumber numberWithInt:7],
                                   };
        NSLog(@"Total cars : %@",carStock);
        
        //Acsessing values using Values
        NSArray *carOutOfStock = [carStock allKeysForObject:[NSNumber numberWithInt:0]];
        
        
        //Prints the objects which is having 0 values seperated by : symbol
        NSLog(@"These Cars are not availbale in showroom now %@",[carOutOfStock componentsJoinedByString:@"  : "]);
        
        //Total cars
        
        NSLog(@"Now total %ld car models available in showroom",[carStock count]);
        
    }
    //Returns 0 to main method
    return 0;
}
