//
//  Numz.m
//  Objective-C Polymorphism
//
//  Created by test on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Numz.h"

@implementation Numz

-(void)setNumbers : (int)a : (int)b{

    num1 = a;
    num2 = b;
}
-(void)add{

    answer = num2+num1;
}
-(void)print{

    NSLog(@"I am from Number class and the Addition of %i & %i is : %i",num1,num2,answer);

}
@end
