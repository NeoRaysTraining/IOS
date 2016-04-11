//
//  Coupe.m
//  Objective-C Categories
//
//  Created by Meheboob on 4/10/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Coupe.h"
#import "Car+Protected.h"
#import "Car.h"
@implementation Coupe
-(void)insideCoupe{
    NSLog(@"Inside Coupe Class Inside Coupe method");

}

-(void)startEngine{

    [super startEngine];
   
    //Call Protected methodes instead of drive
    [self prepareToDrive];

}

-(void)drive{
    NSLog(@"Vrooooooooooommmm!!!!");
}
@end
