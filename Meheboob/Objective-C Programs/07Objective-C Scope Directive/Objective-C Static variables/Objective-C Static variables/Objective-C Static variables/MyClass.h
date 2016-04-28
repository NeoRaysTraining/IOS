//
//  MyClass.h
//  Objective-C Static variables
//
//  Created by test on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject


-(void)addOne;
-(void)printIt;

//We cannot declare static variables in interface
//static int staticVar = 12;
@end
