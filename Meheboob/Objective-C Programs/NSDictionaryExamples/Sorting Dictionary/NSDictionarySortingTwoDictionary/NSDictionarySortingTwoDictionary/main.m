//
//  main.m
//  NSDictionarySortingTwoDictionary
//
//  Created by test on 3/30/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Creating dictionary
        NSDictionary *booksWithPrice = @{
                                               @"Objective-C" : [NSDecimalNumber decimalNumberWithString:@"123.66"],
                                               
                                               @"Java" : [NSDecimalNumber decimalNumberWithString:@"450.99"],
                                               
                                               @"HTML" : [NSDecimalNumber decimalNumberWithString:@"123.65"],
                                               @"CSS" : [NSDecimalNumber decimalNumberWithString:@"234.88"]
                                               
                                               
                                               
                                               
                                               };
        NSArray *booksSortedPrice = [booksWithPrice keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id  obj2) {
            return [obj1 compare:obj2];
        }];
        
        NSLog(@"Books in sorted prices : %@",booksSortedPrice);

        //Prigram to filter Objects within a given range
        
        m
        
        
    }
    return 0;
}
