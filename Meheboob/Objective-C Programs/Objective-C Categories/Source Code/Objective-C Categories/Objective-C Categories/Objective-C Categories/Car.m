//
//  Car.m
//  Objective-C Categories
//
//  Created by Meheboob on 4/10/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Car.h"
#import "Car+Protected.h"

@implementation Car

@synthesize model = _model;

-(void)startEngine{
    NSLog(@"Starting %@ Engine Car",_model);
}

-(void)turnLeft{
    NSLog(@"Turning %@ Car Left side ",_model);
}
-(void)turnRight{
    NSLog(@"Turning Right %@ car",_model);
}
-(void)stop{
    NSLog(@"Stopping %@ Car",_model);
}
-(void)prepareToDrive{
    [self prepareToDrive];
    NSLog(@"Now Driving %@ Car",_model);
}
@end
