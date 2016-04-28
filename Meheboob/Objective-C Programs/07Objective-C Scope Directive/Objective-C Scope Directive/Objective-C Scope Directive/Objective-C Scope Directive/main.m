//
//  main.m
//  Objective-C Scope Directive
//
//  Created by Meheboob on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Tuna.h"
#import "Sabiya.h"

//External/Global variable
int gDrunk = 21;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //NOTE : By default all variable in Objective-C. Protected means only class and subclass have the access to it.
        
        //PRIVATE :  Private variable atre accessed only in same class
        
        NSLog(@" The val of gDrunk var from main is : %i",gDrunk);
        
        Tuna *fish = [[Tuna alloc]init];
        
        [fish changeVar];
         NSLog(@" The val of gDrunk var After fish is : %i",gDrunk);
        
        [fish add];
        
      Sabiya *mySabiya =   [[Sabiya alloc]init];
        [mySabiya addTwoNums];
        
        [mySabiya add];
        
    }
    return 0;
}
