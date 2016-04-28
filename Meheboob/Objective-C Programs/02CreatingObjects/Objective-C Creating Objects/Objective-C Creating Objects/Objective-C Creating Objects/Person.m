//
//  Person.m
//  Objective-C Creating Objects
//
//  Created by test on 4/6/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Person.h"

@implementation Person


-(void)print{

    NSLog(@"I am %i years old and my weight is %i Kg's",age,weight);


}

-(void)setAge : (int)a{
    age = a;

}

-(void)setWeight : (int)w{

    weight = w;
}

@end
