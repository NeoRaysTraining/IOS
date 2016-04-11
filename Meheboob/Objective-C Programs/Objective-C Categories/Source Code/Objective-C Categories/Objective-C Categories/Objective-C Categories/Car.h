//
//  Car.h
//  Objective-C Categories
//
//  Created by Meheboob on 4/10/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
@property (copy) NSString *model;
@property (readonly)double odometer;

-(void)startEngine;
-(void)turnLeft;
-(void)turnRight;
-(void)stop;

@end
