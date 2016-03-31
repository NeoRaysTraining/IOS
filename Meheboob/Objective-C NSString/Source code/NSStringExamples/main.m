//
//  main.m
//  NSStringExamples
//
//  Created by test on 3/27/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Creating String
        NSString *carName = @"Maruthi";
        
        //Creating String
        NSString *carModel = @"800";
        
        //Creting year for the Car
        int year = 1993;
        
        //Printing Car details by using method stringWithFormat
        NSString *carDetails = [NSString stringWithFormat:@"The car Company is %@ Car Model is %@ and Car Released in %i",carName,carModel,year];
        
        //print Statement to print car details
        NSLog(@"%@",carDetails);
    }
    return 0;
}
