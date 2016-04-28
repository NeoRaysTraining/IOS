//
//  main.m
//  Objective-C Static variables
//
//  Created by Meheboob on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
     
       //Creating Object of myClass
        MyClass *meheboob = [[MyClass alloc]init];
        
        
        //Add one to staticVar
        [meheboob addOne];
        
        //prints staticVar
        [meheboob printIt];
        
        [meheboob addOne];
        
        [meheboob printIt];
        
        [meheboob addOne];
        
        [meheboob printIt];
        
        [meheboob addOne];
        
        [meheboob printIt];
        
        [meheboob addOne];
        
        [meheboob printIt];
    }
    return 0;
}
