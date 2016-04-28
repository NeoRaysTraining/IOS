//
//  Tuna.m
//  Objective-C Scope Directive
//
//  Created by test on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Tuna.h"

@implementation Tuna

-(void)changeVar{
    
    //extern : Acccess the Val outside the method
    
    extern int gDrunk;
    
    gDrunk = 13;

}
-(void)add{

    varY=10;
    varG=20;
    int varD = varG+varY;
    NSLog(@"This is from add method from Tuna class %i",varD);
}
@end
