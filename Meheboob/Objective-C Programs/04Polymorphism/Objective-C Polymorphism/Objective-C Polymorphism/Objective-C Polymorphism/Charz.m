//
//  Charz.m
//  Objective-C Polymorphism
//
//  Created by test on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Charz.h"

@implementation Charz

-(void)setChar{
c1 = 'M';
c2 = 'S';
}
-(void)add{
    NSLog(@"The added character are %c and %c",c1,c2);
}
-(void)print{
    NSLog(@"I am from Char class...");
}
@end