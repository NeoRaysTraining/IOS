//
//  main.m
//  Objective-C Typecasting
//
//  Created by Meheboob.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        float f1 = 23.66;
        
        //Type Casting
        NSLog(@"My Current Age %i",(int)f1);
        
        float f2;
        int i2 = 15,i3  =10;
        
        NSLog(@"IceCream rate is %f",(float)i2);
        
        f2 =(float)i3/8;
        
        NSLog(@"%f ",f2);
        
        int myAge = (int)23.44;
        NSLog(@"My Age after 5 years %i",myAge);
        
        myAge = myAge+5;
        NSLog(@"My Age %i",myAge);
        
        myAge+=5;
        NSLog(@"My Age after 10 years %i",myAge);
        
    }
    return 0;
}
