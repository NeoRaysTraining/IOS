//
//  MyClass.m
//  Objective-C Static variables
//
//  Created by test on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "MyClass.h"

//static int staticVar Only makes it global not extern
//Class like Numz,Charz will not have access
//staticVar is restricted to only this file

static int staticVar = 10;

@implementation MyClass
-(void)addOne{
    staticVar++;
}

-(void)printIt{
    NSLog(@"The Val of static var is : %i",staticVar);
}
@end
