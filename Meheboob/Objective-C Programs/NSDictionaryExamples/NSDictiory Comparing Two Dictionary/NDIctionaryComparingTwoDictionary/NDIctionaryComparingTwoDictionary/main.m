//
//  main.m
//  NDIctionaryComparingTwoDictionary
//
//  Created by test on 3/30/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
     
        //Creating dictionary
        
        NSDictionary *booksInFirstLibrary = @{
                                         @"Objective-C" : [NSNumber numberWithInt:33],
                                         
                                         @"Java" : [NSNumber numberWithInt:54],
                                         
                                         @"HTML" : [NSNumber numberWithInt:77],
                                         @"CSS" : [NSNumber numberWithInt:22]
                                         
                                         
                                         
                                         
                                         };
        
        //Creating dictionary
        NSDictionary *booksInSecondLibrary = @{
                                              @"Objective-C" : [NSNumber numberWithInt:33],
                                              
                                              @"Java" : [NSNumber numberWithInt:54],
                                              
                                              @"HTML" : [NSNumber numberWithInt:77],
                                              @"CSS" : [NSNumber numberWithInt:22]
                                              
                                              
                                              
                                              
                                              };
        
        //Compares dictionary isEqualToDictionary using method
       
        if([booksInFirstLibrary isEqualToDictionary:booksInSecondLibrary])
        {
            NSLog(@"Both Libraries are having same number of books");
        }
        
        else
        {
            NSLog(@"Both libraries are having different number of books");
        }
        
        
        
    }
    return 0;
}
