//
//  main.m
//  Objective-C Categories
//
//  Created by Meheboob on 4/10/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Car.h"
#import "Car+Maintanance.h"
#import "Coupe.h"
#import "Coupe.m"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
       Car *maruthiCar =  [[Car alloc]init];
        
        maruthiCar.model = @"Maruthi 800";
        
        Car *hundaiCar = [[Car alloc]init];
    
        hundaiCar.model = @"Santro Xing";
        
        
        [maruthiCar startEngine];
        
        [hundaiCar changeOil];
        
        [hundaiCar turnLeft];
        
        [hundaiCar turnRight];
        
        if([maruthiCar needToChangeOil])
        {
            [maruthiCar changeOil];
        }
        
        [maruthiCar cleanCar];
        
        [maruthiCar jumpBattery:hundaiCar];

        Car *ford = [[Car alloc]init];
    
        ford.model = @"ford F-150";
        
        [ford startEngine];
        
        //Calling th eprotected methods Results error
        
        //[ford drive];
        
        
       Car *honda =  [[Coupe alloc]init];
        
        honda.model = @"Honda-Civic";
        
       // Calls the protected method
        [honda startEngine];
        
       // [honda drive];
        
        [honda prepareToDrive];
        
        SEL protectedMethod = @selector(prepareToDrive);
        if ([honda respondsToSelector:protectedMethod]) {
            // This *will* work
            [honda performSelector:protectedMethod];
        }
    }
    return 0;
}
