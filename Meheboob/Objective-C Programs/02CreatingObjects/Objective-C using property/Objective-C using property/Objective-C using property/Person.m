//
//  Person.m
//  Objective-C using property
//
//  Created by test on 4/6/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)print{

    NSLog(@"I am %i years old and my weight is %i Kg's ",_age,_weight);

}

-(void)maxAge : (int)a{
    NSLog(@"The max age for more fun is %i",a/2+7);

}

-(void)setSalary : (int)minSal : (int)maxSal{

    NSLog(@"My Average salary for a month is %i",(minSal/2+20000)-(1/maxSal));

}
@end
