//
//  main.m
//  Objective-C Inheritance
//
//  Created by test on 4/6/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Maruthi.h"
#import "BMW.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
       Car *myOldCar =  [[Car alloc]init];
        
       int carWheels =  [myOldCar serNumberOfWheels:4];
        
        NSLog(@"All Cars having %i wheels ",carWheels);
        
        [myOldCar turnLeft];
        
        [myOldCar turnRight];
        
        Maruthi *maruthiCar = [[Maruthi alloc]init];
        
        [maruthiCar powerSteering];
        
        [maruthiCar turnLeft];
        
        
       BMW *myBMW =  [[BMW alloc]init];
        
        [myBMW turnLeft];
        
        [myBMW powerWindow];
    }
    return 0;
}
