//
//  Car+Maintanance.h
//  Objective-C Categories
//
//  Created by Meheboob on 4/10/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Car.h"

@interface Car (Maintanance)

-(BOOL)needToChangeOil;
-(void)changeOil;
-(void)cleanCar;
-(void)jumpBattery :(Car *)anotherCar;

@end
