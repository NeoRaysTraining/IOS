//
//  main.m
//  HelloDemo
//
//  Created by test on 3/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hello.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        Hello *hello=[[Hello alloc]init];
        
        [hello demo];
    
    }
    return 0;
}
