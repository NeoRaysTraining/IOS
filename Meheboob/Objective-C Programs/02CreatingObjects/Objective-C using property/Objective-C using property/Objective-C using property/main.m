//
//  main.m
//  Objective-C using property
//
//  Created by test on 4/6/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        
        Person *meheboob = [[Person alloc]init];
        
//        [meheboob setWeight:63];
//        
//        [meheboob setAge:23];
        
        meheboob.age = 23;
        
        meheboob.weight = 63;
        
        [meheboob maxAge:23];
        
        [meheboob setSalary:60000 :1200000];
        
        [meheboob print];
    }
    return 0;
}
