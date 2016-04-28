//
//  Person.m
//  Objective-C data Encapsulation
//
//  Created by test on 4/5/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)print{
    NSLog(@"I am %i yers old and my weight is %i Kg's",age,weight);
}
-(void)setAge : (int)a{

    age = a;

}
-(void)setWeight : (int)w{
    weight = w;

}
-(int)age{
    return age;
}
-(int)weight{

    return weight;

}
@end
