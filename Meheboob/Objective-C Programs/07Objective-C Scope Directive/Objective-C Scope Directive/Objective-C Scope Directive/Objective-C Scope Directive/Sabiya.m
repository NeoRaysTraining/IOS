//
//  Sabiya.m
//  Objective-C Scope Directive
//
//  Created by test on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Sabiya.h"

@implementation Sabiya
-(void)addTwoNums{
    
    //Error Because of private variables
   
    //varY = 10;
    //varG = 20;
    
    
    Vare = 5;
    Varh = 9;
    
    int result = Varh+Vare;
    
    NSLog(@"The sum from protected variable from sabiya class : %i",result);

}
@end
