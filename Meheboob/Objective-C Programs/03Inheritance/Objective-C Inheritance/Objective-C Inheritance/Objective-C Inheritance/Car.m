//
//  Car.m
//  Objective-C Inheritance
//
//  Created by test on 4/6/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Car.h"

@implementation Car
-(int)serNumberOfWheels : (int)wheels{

    NSLog(@"The car is havimg %i wheels",wheels);
    
    return wheels;
}

-(void)turnLeft{
    NSLog(@"car is turning left");
}
-(void)turnRight{
    NSLog(@"Car is turning right");

}
@end
