//
//  main.m
//  NSDictionaryEnumeratingObjects
//
//  Created by test on 3/30/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        //Creating dictionary
        NSDictionary *textBooks = @{
                                    @"Objective-C" : [NSNumber numberWithInt:60],
                                    @"Java" :[NSNumber numberWithInt:33],
                                    @".NET" : [NSNumber numberWithInt:7],
                                    @"Java Script" : [NSNumber numberWithInt:55]
                                    
                                    
                                    };
        
        //Enumarating dictionary using for loop
        for (id books in textBooks) {
    
            NSLog(@" %@ --> textBooks are availble in Library are : %@",textBooks[books],books);
        }
    }
    return 0;
}
