//
//  main.m
//  NSMutableArraySortingWithDescriptors
//
//  Created by test on 3/28/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Creating Dictionay Object
        NSDictionary *carCompany1 = @{
                                      @"Company" : @"Maruthi",
                                      @"model" : @"800",
                                      @"price" : [NSDecimalNumber decimalNumberWithString:@"345000.00"]
                                      };
                                      
        
                                      //Prints var carCompany1
        NSLog(@"My Car1 Details : %@",carCompany1);
        
        //Creating Dictionay Object
        NSDictionary *carCompany2 = @{
                                      @"Company" : @"Hundai",
                                      @"model" : @"Santro",
                                      @"price" : [NSDecimalNumber decimalNumberWithString:@"460000.00"]
                                      };
        
        
        //Prints var carCompany1
        NSLog(@"My Car2 Details : %@",carCompany2);
        
        
        //Creating Dictionay Object
        NSDictionary *carCompany3 = @{
                                      @"Company" : @"Toyota",
                                      @"model" : @"Innova",
                                      @"price" : [NSDecimalNumber decimalNumberWithString:@"748000.00"]
                                      };
        
        
        //Prints var carCompany1
        NSLog(@"My Car3 Details : %@",carCompany3);
        
        
        //Creating Dictionay Object
        NSDictionary *carCompany4 = @{
                                      @"Company" : @"Mahendra",
                                      @"model" : @"Bulero",
                                      @"price" : [NSDecimalNumber decimalNumberWithString:@"648000.00"]
                                      };
        
        
        //Prints var carCompany1
        NSLog(@"My Car4 Details : %@",carCompany4);
        
        //Creating Array by using dictionary Objects
        NSMutableArray *allMyCars = [NSMutableArray arrayWithObjects:@"carCompany1",@"carCompany2",@"carCompany3",@"carCompany4", nil];
        
        NSLog(@"All my cars details : %@",allMyCars);
        
        
    }
    return 0;
}
