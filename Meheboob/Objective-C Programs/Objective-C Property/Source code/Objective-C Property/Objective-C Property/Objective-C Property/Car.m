//
//  Car.m
//  Objective-C Property
//
//  Created by Meheboob on 10/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Car.h"

@implementation Car
@synthesize running = _running;

-(void)startEngine{
    _runningCar =YES;
}
-(void)stopEngine{
    
    _runningCar = NO;

}
@end
