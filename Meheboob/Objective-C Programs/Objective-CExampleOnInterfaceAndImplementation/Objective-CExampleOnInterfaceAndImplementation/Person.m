//
//  Person.m
//  Objective-CExampleOnInterfaceAndImplementation
//
//  Created by test on 4/5/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Person.h"

@implementation Person


-(void)print

{

    NSLog(@"I am %i years old and my weight is %i kgs",age,weight);
}
-(void)setAge : (int)a
{
    age = a;
}
-(void)setWeight : (int)w
{
    weight = w;
}

@end
