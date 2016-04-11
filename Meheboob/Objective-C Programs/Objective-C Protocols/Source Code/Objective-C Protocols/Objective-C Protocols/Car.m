//
//  Car.m
//  Objective-C Protocols
//
//  Created by Meheboob on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Car.h"

@implementation Car

-(void)signalStop
{
    NSLog(@"Car is stopped due Stop signal");
}

-(void)signalrightTurn{
    NSLog(@"Car is turned Right");
}

-(void)signalLeftTurn{
    NSLog(@"Car is turned left due to left signal");
}

@end
