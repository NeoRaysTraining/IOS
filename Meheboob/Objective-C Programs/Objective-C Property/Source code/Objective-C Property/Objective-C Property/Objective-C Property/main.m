//
//  main.m
//  Objective-C Property
//
//  Created by Meheboob on 10/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Car *maruthi = [[Car alloc]init];
        
        maruthi.running = YES;
        
        NSLog(@"Is Maruthi Car Running ? : %d",maruthi.running);
        
        NSLog(@" %d",[maruthi running]);
        
        [maruthi startEngine];
        
        NSLog(@"Is my Car is Running : %d",maruthi.isRunning);
        
        //Error no setter method
        
        //maruthi.isRunning = NO;
        
    }
    return 0;
}
