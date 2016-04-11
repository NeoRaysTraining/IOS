//
//  Car.h
//  Objective-C Property
//
//  Created by Meheboob on 10/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
@property BOOL running;

@property (getter=isRunning, readonly) BOOL runningCar;
-(void)startEngine;
-(void)stopEngine;
@end
