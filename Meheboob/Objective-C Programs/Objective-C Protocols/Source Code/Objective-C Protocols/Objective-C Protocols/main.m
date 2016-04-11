//
//  main.m
//  Objective-C Protocols
//
//  Created by Meheboob on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bicycle.h"
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        
        //Craeting object of Bicycle
        Bicycle *myBicycle = [[Bicycle alloc]init];
        
        [myBicycle startPadling];
        
        [myBicycle signalLeftTurn];
        
        [myBicycle signalrightTurn];
        
        [myBicycle signalStop];
        
        [myBicycle lockTheStructre:nil];
        
        [myBicycle removeFrontWheel];
        
          //Craeting object of Car
        
        Car *myCar = [[Car alloc]init];
        
        [myCar signalStop];
        
        [myCar signalrightTurn];
        
        [myCar signalLeftTurn];
        
        
        //Executes only protocols methods
        
        id<TrafficRules> myVehicle = [[Bicycle alloc]init];
        
        [myVehicle signalrightTurn];
        
        [myVehicle signalStop];
        
      //Executes only protocols methods
        
        myVehicle = [[Car alloc]init];
        
        [myVehicle signalStop];
        
        [myVehicle signalrightTurn];
        
        
        if([myVehicle conformsToProtocol:@protocol(TrafficRules)])
        {
            [myVehicle signalStop];
            [myVehicle signalLeftTurn];
            [myVehicle signalrightTurn];
        }
    }
    return 0;
}
