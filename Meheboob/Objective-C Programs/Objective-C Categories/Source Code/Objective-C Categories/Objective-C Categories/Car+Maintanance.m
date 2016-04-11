//
//  Car+Maintanance.m
//  Objective-C Categories
//
//  Created by Meheboob on 4/10/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Car+Maintanance.h"

@implementation Car (Maintanance)
-(BOOL)needToChangeOil{
    return YES;
}

-(void)changeOil{
    NSLog(@"Changing oil for %@ vehicle",[self model]);
}
-(void)cleanCar{
    NSLog(@"Cleaning Car of %@ vehicle",[self model]);
}
-(void)jumpBattery :(Car *)anotherCar{
    NSLog(@"Jumped the car %@ with another car %@",[self model],[anotherCar model]);
}
@end
